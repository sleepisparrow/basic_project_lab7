import 'package:flutter/material.dart';
import 'package:frame/Provider/quiz_finish_provider.dart';
import 'package:frame/screen/student/stu_waiting_for_result_screen.dart';
import 'package:provider/provider.dart';

class StuQuizResultScreen extends StatefulWidget {
  const StuQuizResultScreen({Key? key}) : super(key: key);

  @override
  State<StuQuizResultScreen> createState() => _StuQuizResultScreenState();
}

class _StuQuizResultScreenState extends State<StuQuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    bool resultOpened = context.watch<QuizFinishProvider>().isQuizFinished;

    if (!resultOpened) {
      return const StuWaitingForResultScreen();
    } else {

      // TODO: 여기 이 부분을 교수가 결과 확인 눌렀을 때 나오는 페이지로 수정할 것
      return const Nextpage();
    }
  }
}
