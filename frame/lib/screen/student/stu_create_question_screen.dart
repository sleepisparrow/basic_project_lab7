import 'package:flutter/material.dart';
import 'package:frame/screen/student/stu_main.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';

import '../../Provider/stu_question_provider.dart';

class StuCreateQuestion extends StatelessWidget {
  const StuCreateQuestion({Key? key}) : super(key: key);

  //학생 질문 작성 페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/2 * 1,
          width: MediaQuery.of(context).size.width - 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            border: Border.all(
              width: 3,
              color: NeedColors.darkBlue,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _TitleTextField(),
                SizedBox(
                  height: 10,
                ),
                _ContentsTextField(),
                CompleteButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleTextField extends StatefulWidget {
  const _TitleTextField({Key? key}) : super(key: key);

  @override
  State<_TitleTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<_TitleTextField> {
  static TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "제목",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            hintText: "제목을 입력해주세요",
          ),
        )
      ],
    );
  }
}

class _ContentsTextField extends StatefulWidget {
  const _ContentsTextField({Key? key}) : super(key: key);

  @override
  State<_ContentsTextField> createState() => _ContentsTextFieldState();
}

class _ContentsTextFieldState extends State<_ContentsTextField> {
  static TextEditingController contentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "질문 내용",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: contentsController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 6,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(), hintText: "질문할 내용을 입력해주세요"),
        )
      ],
    );
  }
}

class CompleteButton extends StatelessWidget {
  const CompleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StuMain(),
              ),
            );
          },
          child: const Text('취소'),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(NeedColors.darkBlue),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<StuQuestionProvider>(context, listen: false)
                .createQuestion(
              _TitleTextFieldState.titleController.text,
              _ContentsTextFieldState.contentsController.text,
            ); // Provider로 값 전달
            _TitleTextFieldState.titleController.text = "";
            _ContentsTextFieldState.contentsController.text = "";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StuMain(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(NeedColors.darkBlue),
          ),
          child: const Text('완료'),
        ),
      ],
    );
  }
}
