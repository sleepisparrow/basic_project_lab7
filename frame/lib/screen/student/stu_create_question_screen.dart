import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frame/screen/student/stu_main.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';

import '../../Provider/stu_question_provider.dart';

class StuCreateQuestion extends StatefulWidget {
  const StuCreateQuestion({Key? key}) : super(key: key);

  @override
  State<StuCreateQuestion> createState() => _StuCreateQuestionState();
}

class _StuCreateQuestionState extends State<StuCreateQuestion> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();


  ///텍스트 폼 글자사용할 수 있게 하는 컨트롤러
  var _userEnterMessage = '';
  var _userEnterMessage1 = '';

  void _sendMessage() {
    FocusScope.of(context).unfocus(); /// 다른 곳 누르면 키보드 사라지게 하기
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('room/gwZyIGV4iDrQVkX7zMTW/question').add({
      'title': _userEnterMessage,
      'content': _userEnterMessage1,
      'time' : Timestamp.now(),
      'userId' : user!.uid,
      'answer' : false,
    });
  }

  //학생 질문 작성 페이지
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
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
              Column(
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
                    controller: _controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      hintText: "제목을 입력해주세요",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _userEnterMessage = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
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
                    controller: _controller1,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 6,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        hintText: "질문할 내용을 입력해주세요"),
                    onChanged: (value){
                      setState(() {
                        _userEnterMessage1 = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    ///창 닫기
                    child: const Text('취소'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(NeedColors.darkBlue),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_userEnterMessage.compareTo('') == 0 &&
                          _userEnterMessage1.compareTo('') == 0) {
                        Fluttertoast.showToast(
                          msg: "제목과 질문 내용을 입력해주세요",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: NeedColors.darkBlue,
                          textColor: Colors.white,
                          fontSize: 16.0, //
                        );
                      } else if (_userEnterMessage.compareTo('') == 0) {
                        Fluttertoast.showToast(
                          msg: "제목을 입력해주세요",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: NeedColors.darkBlue,
                          textColor: Colors.white,
                          fontSize: 16.0, //
                        );
                      } else if (_userEnterMessage1.compareTo('') == 0) {
                        Fluttertoast.showToast(
                          msg: "질문 내용을 입력해주세요",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: NeedColors.darkBlue,
                          textColor: Colors.white,
                          fontSize: 16.0, //
                        );
                      } else {
                        _sendMessage();
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(NeedColors.darkBlue),
                    ),
                    child: const Text('완료'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
