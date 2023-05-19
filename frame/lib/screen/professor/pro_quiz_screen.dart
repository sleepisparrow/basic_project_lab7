import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_quiz_main_provider.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:provider/provider.dart';

class ProQuizScreen extends StatefulWidget {
  const ProQuizScreen({Key? key, this.widgetDeleteFlag = false}) : super(key: key);

  final bool widgetDeleteFlag;

  @override
  State<ProQuizScreen> createState() => ProQuizScreenState();
}

class ProQuizScreenState extends State<ProQuizScreen> {
  var _widgetDeleteFlag = false;
  dynamic listWidget =
      (int index, BuildContext context, List<String> questions) =>
          _DefaultListWidget(
            index: index,
            context: context,
            questions: questions,
          );

  @override
  Widget build(BuildContext context) {
    // TODO: dummy data for ui testing. Must remove after.
    ProfQuizMainProvider dummyProvider =
        Provider.of<ProfQuizMainProvider>(context);
    for (int i = 0; i < QuizDummy.quizes.length; i++) {
      dummyProvider.addQuestion(QuizDummy.quizes[i]);
    }

    ProfQuizMainProvider provider = Provider.of<ProfQuizMainProvider>(context);
    List<String> questions = provider.question;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            // shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return listWidget(index, context, questions);
            },
            itemCount: questions.length,
          )),
          ButtonSet(setListWidget),
        ],
      ),
    );
  }

  void setListWidget() {
    if (!_widgetDeleteFlag) {
      setState(() {
        listWidget =
            (int index, BuildContext context, List<String> questions) =>
                _DeleteListWidget(
                  index: index,
                  context: context,
                  questions: questions,
                );
      });
      _widgetDeleteFlag = true;
    } else {
      setState(() {
        listWidget =
            (int index, BuildContext context, List<String> questions) =>
                _DefaultListWidget(
                  index: index,
                  context: context,
                  questions: questions,
                );
      });
      _widgetDeleteFlag = false;
    }
  }
}

class _DeleteListWidget extends StatefulWidget {
  const _DeleteListWidget(
      {Key? key,
      required this.index,
      required this.context,
      required this.questions})
      : super(key: key);

  final int index;
  final BuildContext context;
  final List<String> questions;

  @override
  State<_DeleteListWidget> createState() => _DeleteListWidgetState();
}

class _DeleteListWidgetState extends State<_DeleteListWidget> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checkboxValue,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue = value!;
              });
            }),
        Expanded(
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ColoredBox(
                color: const Color(0xffe3e5ee),
                child: SizedBox(
                  height: 80,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      widget.questions[widget.index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DefaultListWidget extends StatefulWidget {
  const _DefaultListWidget(
      {Key? key,
      required this.index,
      required this.context,
      required this.questions})
      : super(key: key);
  final int index;
  final BuildContext context;
  final List<String> questions;

  @override
  State<_DefaultListWidget> createState() => _DefaultListWidgetState();
}

class _DefaultListWidgetState extends State<_DefaultListWidget> {
  int? index;
  BuildContext? parentContext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ColoredBox(
          color: const Color(0xffe3e5ee),
          child: SizedBox(
            height: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                widget.questions[index!],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    index = widget.index;
    parentContext = widget.context;
  }
}

class ButtonSet extends StatelessWidget {
  const ButtonSet(
    this.function, {
    Key? key,
  }) : super(key: key);

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomButton(
            onPressed: function,
            child: const Text('삭제'),
          ),
          _BottomButton(
            onPressed: () {},
            child: const Text('공개'),
          ),
          _BottomButton(
            onPressed: () {},
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  /// 메인페이지 가장 밑의 청록색 버튼 3개를 위한 클래스
  const _BottomButton({Key? key, this.child, this.onPressed}) : super(key: key);

  final dynamic child;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(64, 48),
        backgroundColor: const Color(0xff2296AF),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
