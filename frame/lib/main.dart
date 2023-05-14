import 'package:flutter/material.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';
import 'package:frame/screen/std_feedback.dart';
import 'package:provider/provider.dart';
import 'package:frame/screen/login_screen.dart';
import 'package:frame/screen/prof_feedback_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
      ],
      child: MaterialApp(
        home: StdFeedbackPage(),
      )
    ),
  );
}
