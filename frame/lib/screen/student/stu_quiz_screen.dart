import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';

class StuQuizScreen extends StatelessWidget {
  const StuQuizScreen({Key? key}) : super(key: key);

  ///네비게이션바의 질문눌렀을때 퀴즈페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ExplanationText(),
              SizedBox(
                height: 15,
              ),
              _SelectedOX(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _SubmitButton(),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExplanationText extends StatelessWidget {
  const _ExplanationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: NeedColors.darkBlue,
            width: 3,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
            child: Text(
              'O/X 퀴즈',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,

                /// fontSize 넣기
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 3.0, 0, 5.0),
            child: Text(
              '교수님의 질문에 답하세요',
            ),
          )
        ],
      ),
    );
  }
}

class _SelectedOX extends StatefulWidget {
  const _SelectedOX({Key? key}) : super(key: key);

  @override
  State<_SelectedOX> createState() => _SelectedOXState();
}

class _SelectedOXState extends State<_SelectedOX> {
  List<bool> _isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        Container(
          height: MediaQuery.of(context).size.width/4 * 3,
          width: MediaQuery.of(context).size.width / 2 - 33,
          margin: EdgeInsets.all(8.0),
          child: Icon(
            Icons.circle_outlined,
            size: 80,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width/4 * 3,
          width: MediaQuery.of(context).size.width / 2 - 33,
          margin: EdgeInsets.all(8.0),
          child: Icon(
            Icons.close_outlined,
            size: 80,
          ),
          decoration: BoxDecoration(),
        ),
      ],
      fillColor: NeedColors.darkBlue,
      selectedColor: Colors.white,
      color: Colors.black,
      borderColor: NeedColors.darkBlue,
      selectedBorderColor: NeedColors.darkBlue,
      borderWidth: 3,
      borderRadius: BorderRadius.circular(15.0),
      onPressed: (int index) {
        if (!_isSelected[index]) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = (i == index);
            }
          });
        }
      },
      isSelected: _isSelected,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(80, 50)),
        backgroundColor: MaterialStatePropertyAll(NeedColors.darkBlue),
      ),
      child: Text('제출'),
    );
  }
}
