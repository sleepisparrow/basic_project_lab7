import 'package:flutter/material.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:frame/screen/stu_selection_quiz_widget.dart';
import 'package:frame/screen/stu_tf_quiz_widget.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';

import '../Provider/studnet_quiz_provider.dart';


//UI TODOS
// TODO: 질문 container width를 고정시키기
// TODO: 질문 Text를 위에 중앙에 배치시키기
// TODO: prevButton, nextButton을 조정하기
// TODO: 완료 버튼 디자인 변경하기
// TODO: padding? margin (밑의 버튼들) 부여하기

// 그리고 이제 선택 페이지로 넘어가자
class StuQuizBackgroundPage extends StatelessWidget {
  const StuQuizBackgroundPage({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    //TODO: 이건 더미 데이터니까 UI 테스팅 외에는 사용하지 말 것
    var dummyProvider = Provider.of<StudentQuizProvider>(context);
    for (int i = 0; i < QuizDummy.quizes.length; i++) {
      dummyProvider.addQuestion(QuizDummy.quizes[i]);
    }

    var provider = Provider.of<StudentQuizProvider>(context);
    Quiz currentQuiz = provider.quizList[index];

    return Column(
      children: [
        _QuestionBox(question: currentQuiz.question!),
        Expanded(
          child: getSelectionBox(currentQuiz),
        ),
        UnderBarButtons(
          currentIndex: index,
          totalPageCount: provider.quizList.length,
        )
      ],
    );
  }

  Widget getSelectionBox(Quiz quiz) {
    if (_isQuizSelection(quiz)) {
      return StuSelectionQuizWidget(index: index);
    } else {
      return StuTFQuizWidget(index: index);
    }
  }

  bool _isQuizSelection(Quiz quiz) {
    return quiz.runtimeType == ChoiceQuiz;
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
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class UnderBarButtons extends StatelessWidget {
  const UnderBarButtons({
    Key? key,
    required this.currentIndex,
    required this.totalPageCount,
  }) : super(key: key);

  /// currentIndex는 0부터 시작함, totalPagecount는 문제 개수(리스트.length)
  final int currentIndex, totalPageCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO: 가능하면 iconButton으로 바꾸기
          _PrevButton(currentIndex: currentIndex),
          Text(
            '${currentIndex + 1} / $totalPageCount',
            textDirection: TextDirection.ltr,
          ),
          _RightButton(currentIndex: currentIndex, totalPageCount: totalPageCount,)
        ],
      ),
    );
  }

  static StuQuizBackgroundPage getNewPage(int targetIndex) {
    return StuQuizBackgroundPage(index: targetIndex);
  }
}

class _PrevButton extends StatelessWidget {
  const _PrevButton({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentIndex != 0,
      child: TextButton(
        key: const Key('prevButton'),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  UnderBarButtons.getNewPage(currentIndex - 1)));
        },
        child: Image.asset('asset/prevButton.png'),
      ),
    );
  }
}

class _RightButton extends StatelessWidget {
  const _RightButton(
      {Key? key, required this.currentIndex, required this.totalPageCount})
      : super(key: key);

  final int currentIndex, totalPageCount;

  @override
  Widget build(BuildContext context) {
    if (currentIndex + 1 == totalPageCount) {
      return const _FinishButton();
    } else {
      return _NextButton(currentIndex: currentIndex);
    }
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('nextButton'),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                UnderBarButtons.getNewPage(currentIndex + 1)));
      },
      child: Image.asset('asset/nextButton.png'),
    );
  }
}

class _FinishButton extends StatelessWidget {
  const _FinishButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // TODO: 디자인 조금 더 수정하기
        onPressed: () {
          // TODO 결과 페이지로 이동하도록 만들기
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     builder: (context) => );
        },
        key: const Key('finishQuizButton'),
        child: const Text('완료'));
  }
}