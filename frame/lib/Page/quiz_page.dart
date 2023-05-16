import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  ///네비게이션바의 질문눌렀을때 퀴즈페이지
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              '퀴즈는 아직 공개되지 않았습니다.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 212,
            child: Image(
              image: AssetImage('asset/lock.png'),
            ),
          )
        ],
      ),
    );
  }
}
