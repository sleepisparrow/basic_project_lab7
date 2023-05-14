import 'package:flutter/material.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';
import 'package:frame/screen/prof_quiz_main_page.dart';
import 'package:provider/provider.dart';

import 'Provider/Prof_quiz_main_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
        ChangeNotifierProvider<ProfQuizMainProvider>(
            create: (_) =>ProfQuizMainProvider()),
      ],
      child: MaterialApp(
        home: ProfQuizMainPage(),
      )
    ),
  );
}
