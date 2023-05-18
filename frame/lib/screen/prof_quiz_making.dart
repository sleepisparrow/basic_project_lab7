
import 'package:flutter/material.dart';

class ProfQuizMakingPage extends StatelessWidget {
  const ProfQuizMakingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          QuestionField(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: _TrueOrFalseQuestionField(),
          ),
        ],
      ),
    );
  }
}

class QuestionField extends StatelessWidget {
  const QuestionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffE3E5EE),
      ),
    );
  }
}

class SelectionQuestion extends StatefulWidget {
  const SelectionQuestion({Key? key}) : super(key: key);

  @override
  State<SelectionQuestion> createState() => _SelectionQuestionState();
}

class _SelectionQuestionState extends State<SelectionQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  top: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                ),
              ),
              height: 24,
              width: 69,
              child: const Center(
                child: Text('객관식'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff11307c), width: 2),
              ),
              height: 24,
              width: 69,
              child: const Center(
                child: Text('T/F'),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Color(0xff11307c),
                    ),
                  ),
                ),
                height: 24,
                width: 69,
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(
                width: 2,
                color: Color(0xff11307c),
              ),
              right: BorderSide(
                width: 2,
                color: Color(0xff11307c),
              ),
              bottom: BorderSide(
                width: 2,
                color: Color(0xff11307c),
              ),
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_QuestionButton(), _QuestionButton()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_QuestionButton(), _QuestionButton()],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(64, 48),
                  backgroundColor: const Color(0xff2296AF),
                ),
                onPressed: () {},
                child: const Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _TrueOrFalseQuestionField extends StatefulWidget {
  const _TrueOrFalseQuestionField({Key? key}) : super(key: key);

  @override
  State<_TrueOrFalseQuestionField> createState() => __TrueOrFalseQuestionFieldState();
}

class __TrueOrFalseQuestionFieldState extends State<_TrueOrFalseQuestionField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff11307c), width: 2),
              ),
              height: 24,
              width: 69,
              child: const Center(
                child: Text('객관식'),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  top: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                ),
              ),
              height: 24,
              width: 69,
              child: const Center(
                child: Text('T/F'),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Color(0xff11307c),
                    ),
                  ),
                ),
                height: 24,
                width: 69,
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                  bottom: BorderSide(
                    width: 2,
                    color: Color(0xff11307c),
                  ),
                )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_QuestionButton(), _QuestionButton()],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(64, 48),
                  backgroundColor: const Color(0xff2296AF),
                ),
                onPressed: () {},
                child: const Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _QuestionButton extends StatefulWidget {
  const _QuestionButton({Key? key}) : super(key: key);

  @override
  State<_QuestionButton> createState() => __QuestionButtonState();
}

class __QuestionButtonState extends State<_QuestionButton> {
  bool isAnswer = false;
  Color buttonColor = const Color(0xff2296AF);

  void resetButton() {
    isAnswer = false;
    buttonColor = const Color(0xff2296AF);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (!isAnswer) {
              setState(() {
                buttonColor = const Color(0xff11307C);
              });
              isAnswer = true;
            } else {
              setState(() {
                buttonColor = const Color(0xff2296AF);
              });
              isAnswer = false;
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 100),
            backgroundColor: buttonColor,
          ),
          child: const Text(''),
        ),
        const SizedBox(
          width: 100,
          child: TextField(
            decoration: InputDecoration(
              hintText: '정답',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
