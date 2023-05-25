import 'package:flutter/material.dart';
import 'package:frame/screen/student/stu_waiting_for_result_screen.dart';

class StuQuizResultScreen extends StatefulWidget {
  /// 학생이 답변을 완료하면 나오는 스크린을 결정하는 위젯
  const StuQuizResultScreen({Key? key}) : super(key: key);

  @override
  State<StuQuizResultScreen> createState() => _StuQuizResultScreenState();
}

class _StuQuizResultScreenState extends State<StuQuizResultScreen> {
  @override
  Widget build(BuildContext context) {
      return const Nextpage();
  }
}
