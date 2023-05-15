import 'package:flutter/material.dart';
import 'package:frame/Provider/Prof_quiz_main_provider.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';
import 'package:frame/screen/std_feedback.dart';
import 'package:frame/screen/prof_quiz_main_page.dart';
import 'package:provider/provider.dart';
import 'package:frame/screen/login_screen.dart';
import 'package:frame/screen/prof_feedback_page.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
        ChangeNotifierProvider<ProfQuizMainProvider>(
            create: (_) => ProfQuizMainProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          cardColor: Colors.grey[100],
        ),
        home: LoginScreen(),
      ),
    ),
  );
}
