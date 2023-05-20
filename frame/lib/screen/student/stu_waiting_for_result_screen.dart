import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';

import '../../Provider/quiz_finish_provider.dart';

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

          // TODO: 이건 테스트를 위해서 만들어진 것이므로 나중에 삭제 해야 함
          ElevatedButton(onPressed: () {
            var provider = Provider.of<QuizFinishProvider>(context, listen: false);
            provider.isQuizFinished = true;
          }, child: Text('다음으로 넘아가기'))
        ],
      ),
    );
  }
}

class Nextpage extends StatelessWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('결과 페이지'),
    );
  }
}
