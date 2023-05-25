import 'package:flutter/material.dart';
import 'package:frame/Provider/quiz_provider.dart';
import 'package:frame/screen/student/stu_quiz_locked_screen.dart';
import 'package:frame/screen/student/stu_quiz_not_reseted.dart';
import 'package:provider/provider.dart';

class StuQuizMain extends StatelessWidget {
  const StuQuizMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool reseted = context.select((QuizProvider p) => p.reseted);
    if (reseted) {
      return StuQuizLockedScreen();
    } else {
      return StuQuizNotReseted();
    }
  }
}