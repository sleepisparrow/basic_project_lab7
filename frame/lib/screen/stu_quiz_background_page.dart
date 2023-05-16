import 'package:flutter/material.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';

import '../Provider/studnet_quiz_provider.dart';

class StuQuizBackgroundPage extends StatelessWidget {
  const StuQuizBackgroundPage({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StudentQuizProvider>(context);
    List<Quiz> quizList = provider.quizList;
    return Column(
      children: [
        _QuestionBox(question: quizList[index].question!),

      ],
    );
  }
}

class _QuestionBox extends StatelessWidget {
  const _QuestionBox({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      color: NeedColors.lightGrey,
      height: 80,
      child: Text(
        question,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
            fontSize: 16
        ),
      ),
    );
  }
}


/// 이 밑 거는 tdd로 한 게 아님. (잘 굴러가는지도 모름)
// class StuQuizBackgroundPage extends StatelessWidget {
//   const StuQuizBackgroundPage({Key? key, required this.index})
//       : super(key: key);
//
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     StudentQuizProvider provider = Provider.of<StudentQuizProvider>(context);
//     List<Quiz> quizList = provider.quizList;
//
//     var questionSelectionWidget = (quizList[index].runtimeType == TFQuiz)
//         ? StuTFQuizWidget(index: index)
//         : StuSelectionQuizWidget(index: index);
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//           color: const Color(0xffE3E5EE),
//           child: Text(quizList[index].question!),
//         ),
//         Container(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             child: questionSelectionWidget),
//         Container(
//           padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//           child: _QuestionMovingButton(
//             currentIndex: index,
//             totalPageCount: quizList.length,
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class _QuestionMovingButton extends StatelessWidget {
//   /// 가장 밑에 있는 다음, 이전 질문으로 이동하는 버튼 2개와 현재 문제를 알려주는 위젯 row
//   const _QuestionMovingButton(
//       {Key? key, required this.currentIndex, required this.totalPageCount})
//       : super(key: key);
//
//   final int currentIndex, totalPageCount;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: 만약 currentIndex + 1이 == totalPageCount 이면 next가 아니라 완료로 바뀌기
//     // TODO: 만약 currentIndex == 0 이면 prev가 비활성화되기
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             onPressed: () {
//               // TODO: 이전 문제로 돌아가는 함수 제작
//             },
//             icon: const Icon(Icons.navigate_before)),
//         Text('$currentIndex/$totalPageCount'),
//         IconButton(
//           onPressed: () {
//             // TODO: 다음 문제로 넘어가는 함수 제작
//           },
//           icon: const Icon(Icons.navigate_next),
//         ),
//       ],
//     );
//   }
// }
