import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_question_provider.dart';
import 'package:frame/Provider/pro_quiz_main_provider.dart';
import 'package:frame/Provider/pro_classroom_list_provider.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:frame/Provider/quiz_finish_provider.dart';
import 'package:frame/Provider/quiz_result_provider.dart';
import 'package:frame/screen/login_screen.dart';
import 'package:frame/Provider/stu_question_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizFinishProvider>(
            create: (_) => QuizFinishProvider()),
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
        ChangeNotifierProvider<ProfQuizMainProvider>(
            create: (_) => ProfQuizMainProvider()),
        ChangeNotifierProvider<QuizResultProvider>(
            create: (_) => QuizResultProvider()),
        ChangeNotifierProvider<ProClassRoomListProvider>(
            create: (_) => ProClassRoomListProvider()),
        ChangeNotifierProvider<StuQuestionProvider>(
            create: (_) => StuQuestionProvider()),
        ChangeNotifierProvider<ProQuestionProvider>(
            create: (_) => ProQuestionProvider()),
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
