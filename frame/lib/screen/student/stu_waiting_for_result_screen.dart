import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:frame/tools/quiz_result_chart_generator.dart';

/// 작성 완료 후에 교수가 완료할 때까지 대기하는 페이지
class StuWaitingForResultScreen extends StatelessWidget {

  const StuWaitingForResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 170,
            height: 170,
            child: CircularProgressIndicator(
              color: NeedColors.darkBlue,
              strokeWidth: 30,
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('테스트가 종료될 때까지 잠시만 기다려주세요'),
          ),
        ],
      ),
    );
  }
}

class Nextpage extends StatelessWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 300,
      child: QuizResultChartGenerator(),
    );
  }
}
