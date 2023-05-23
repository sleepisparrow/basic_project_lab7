import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_question_provider.dart';
import 'package:provider/provider.dart';

import '../../tools/need_colors.dart';

class ProQuestionItem extends StatelessWidget {
  const ProQuestionItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    QuestionData data = context.read<ProQuestionProvider>().questions[index];

    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 10,
              ),
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: NeedColors.darkBlue, width: 2),
                color: NeedColors.lightGrey,
              ),
              child: Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _TextField(title: data.title, content: data.content),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [_BtnAnswer(index: index)]),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: _Buttons(index: index),
          ),
        ],
      ),
    );
  }
}

/// 버튼에 해당하는 내용
/// 이 클래스를 통해 어떤 버튼을 낼 지 결정함
class _Buttons extends StatelessWidget {
  const _Buttons({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    QuestionData data =
        context.select((ProQuestionProvider value) => value.questions[index]);
    if (data.answered) {
      return _Answered();
    } else {
      return _NotAnswered();
    }
  }
}

class _Answered extends StatelessWidget {
  const _Answered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('answered'),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '답변\n완료',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _NotAnswered extends StatelessWidget {
  const _NotAnswered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('answered'),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '답변\n대기',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _BtnAnswer extends StatefulWidget {
  const _BtnAnswer({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<_BtnAnswer> createState() => _BtnAnswerState();
}

class _BtnAnswerState extends State<_BtnAnswer> {

  bool visibleInfo = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibleInfo,
      child: ElevatedButton(
          key: const Key('answered button'),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(NeedColors.darkBlue),
          ),
          onPressed: () {
            ProQuestionProvider provider = context.read<ProQuestionProvider>();
            provider.setAnswered(widget.index);
            visibleInfo = !visibleInfo;
          },
          child: const Text("답변완료")),
    );
  }
}

/// 교수 페이지의 질문과 그 내용에 해당하는 부분
/// title: 제목 (더 크다 )
/// content: 내용
class _TextField extends StatelessWidget {
  const _TextField({Key? key, required this.title, required this.content})
      : super(key: key);

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  제목 : $title',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
          child: Text(
            ' 내용 : $content',
          ),
        ),
      ],
    );
  }
}
