import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';

import 'login_screen.dart';

class StdFeedbackPage extends StatelessWidget {
  const StdFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기초프로젝트랩 6주차'),),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 220, 20),
              child: Text(
                '수업의 난이도는 어땠나요?',
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 100, 80),
              child: _StudyLevel(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 250),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: '건의사항 (선택)'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            _Submit(),
          ],
        ),
      ),
    );
  }
}

class _Submit extends StatelessWidget{
  const _Submit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150, 
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NeedColors.lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '제출',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _StudyLevel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return __StudyLevel();
  }
}

class __StudyLevel extends State{
  final nameController = TextEditingController();
  int? _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
          Text('1'),
          Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
          Text('2'),
          Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
          Text('3'),
          Radio(value: 3, groupValue: _radioValue, onChanged: _radioChange),
          Text('4'),
          Radio(value: 4, groupValue: _radioValue, onChanged: _radioChange),
          Text('5')
        ],
      ),
    );
  }

  _radioChange(int? value){
    setState((){
      _radioValue = value;
    });
  }
}