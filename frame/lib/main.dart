import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_quiz_main_provider.dart';
import 'package:frame/Provider/pro_classroom_list_provider.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:frame/screen/login_screen.dart';

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
