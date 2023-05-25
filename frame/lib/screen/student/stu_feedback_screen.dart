import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frame/tools/need_colors.dart';

class StuFeedBackScreen extends StatefulWidget {
  const StuFeedBackScreen({Key? key}) : super(key: key);

  @override
  State<StuFeedBackScreen> createState() => _StuFeedBackScreenState();
}

class _StuFeedBackScreenState extends State<StuFeedBackScreen> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';
  int? _radioValue = 0;

  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _sendMessage() {
    FocusScope.of(context).unfocus();

    /// 다른 곳 누르면 키보드 사라지게 하기
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .add({
      'level': _radioValue,
      'text': _userEnterMessage.replaceAll('\n', ''),
      'time': Timestamp.now(),
      'userId': user!.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 2, color: NeedColors.darkBlue)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Text(
                          '수업의 난이도는 어땠나요?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '(5: 매우 어려움/4: 어려움/3: 보통/2:쉬움/1: 아주 쉬움)',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 20, 40),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                  value: 1,
                                  groupValue: _radioValue,
                                  onChanged: _radioChange),
                              Text('1'),
                              Radio(
                                  value: 2,
                                  groupValue: _radioValue,
                                  onChanged: _radioChange),
                              Text('2'),
                              Radio(
                                  value: 3,
                                  groupValue: _radioValue,
                                  onChanged: _radioChange),
                              Text('3'),
                              Radio(
                                  value: 4,
                                  groupValue: _radioValue,
                                  onChanged: _radioChange),
                              Text('4'),
                              Radio(
                                  value: 5,
                                  groupValue: _radioValue,
                                  onChanged: _radioChange),
                              Text('5')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.multiline,
                          minLines: 10,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: "건의사항"),
                          onChanged: (value) {
                            setState(() {
                              _userEnterMessage = value;
                            });
                          }),
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          _sendMessage();
                          Fluttertoast.showToast(
                            msg: "제출이 완료되었습니다!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.black,
                            fontSize: 16.0,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(NeedColors.lightGrey),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
