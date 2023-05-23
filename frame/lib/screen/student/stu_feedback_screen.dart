import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';

class StuFeedBackScreen extends StatelessWidget {
  const StuFeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 220, 20),
              child: Text(
                '수업의 난이도는 어땠나요?',
              ),
            ),
            const Center(
              child: Text(
                '5: 매우 어려움/4: 어려움/3: 보통/2:쉬움/1: 아주 쉬움',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 50, 80),
              child: _StudyLevel(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 50, 200),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: '건의사항 (선택)'),
              ),
            ),
            _Submit(),
          ],
        ),
      ),
    );
  }
}

class _Submit extends StatelessWidget {
  const _Submit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
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
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class _StudyLevel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __StudyLevel();
  }
}

class __StudyLevel extends State {
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

  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }
}
