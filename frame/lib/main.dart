import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_quiz_main_provider.dart';
import 'package:frame/Provider/pro_classroom_list_provider.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:frame/Provider/quiz_result_provider.dart';
import 'package:frame/tools/quiz_result_chart_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
        ChangeNotifierProvider<ProfQuizMainProvider>(
            create: (_) => ProfQuizMainProvider()),
        ChangeNotifierProvider<ProClassRoomList>(
            create: (_) => ProClassRoomList()),
        ChangeNotifierProvider<QuizResultProvider>(create:
        (_) => QuizResultProvider())
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
