import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_question_provider.dart';
import 'package:frame/Provider/pro_classroom_list_provider.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:frame/Provider/quiz_finish_provider.dart';
import 'package:frame/Provider/quiz_provider.dart';
import 'package:frame/Provider/stu_quiz_answered_provider.dart';
import 'package:frame/screen/login_screen.dart';
import 'package:frame/Provider/stu_question_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizFinishProvider>(
            create: (_) => QuizFinishProvider()),
        ChangeNotifierProvider<ProfFeedbackProvider>(
            create: (_) => ProfFeedbackProvider()),
        ChangeNotifierProvider<ProClassRoomListProvider>(
            create: (_) => ProClassRoomListProvider()),
        ChangeNotifierProvider<StuQuestionProvider>(
            create: (_) => StuQuestionProvider()),
        ChangeNotifierProvider<ProQuestionProvider>(
            create: (_) => ProQuestionProvider()),
        ChangeNotifierProvider<QuizProvider>(
            create: (_) => QuizProvider()),
        ChangeNotifierProvider<StuQuizAnsweredProvider>(
            create: (_) => StuQuizAnsweredProvider()),
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
