import 'package:flutter/material.dart';
import 'package:frame/Provider/quiz_provider.dart';
import 'package:frame/Provider/stu_quiz_answered_provider.dart';
import 'package:frame/screen/student/stu_quiz_result_screen.dart';
import 'package:frame/screen/student/stu_quiz_screen.dart';
import 'package:frame/screen/student/stu_waiting_for_result_screen.dart';
import 'package:provider/provider.dart';

class StuQuizNotReseted extends StatefulWidget {
  const StuQuizNotReseted({Key? key}) : super(key: key);

  @override
  State<StuQuizNotReseted> createState() => _StuQuizNotResetedState();
}

class _StuQuizNotResetedState extends State<StuQuizNotReseted> {
  Widget? ret;



  @override
  Widget build(BuildContext context) {
    // 1. read로 프로바이더 불러와서 값 가져오기
    StuQuizAnsweredProvider provider = context.read<StuQuizAnsweredProvider>();

    // 2. 그리고 그걸 바탕으로 isAnswered select하기
    bool locked = context.select((QuizProvider p) => p.locked);
    if (locked) {
      // 이건 그냥 파베에서 가져오기, select 써서 가져오기
      return const StuQuizResultScreen();
    }

    provider.getIsAnswered();
    bool? isAnswered =
        context.select((StuQuizAnsweredProvider p) => p.isAnswered);
    isAnswered ??= false;

    if (!isAnswered) {
      setState(() {
        ret = const StuQuizScreen();
      });
    }
    else {
      setState(() {
        ret = const StuWaitingForResultScreen();
      });
    }
    if (ret == null) {
      return const Text('로딩중');
    } else {
      return ret!;
    }
  }

  @override
  void initState() {
    super.initState();
    QuizProvider provider = context.read<QuizProvider>();
    provider.initialize();
    StuQuizAnsweredProvider p = context.read<StuQuizAnsweredProvider>();
    p.initialize();
  }
}
