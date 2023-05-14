import 'package:flutter/material.dart';
import 'package:frame/tools/textform.dart';

class StuQuestionWrite extends StatelessWidget {
  const StuQuestionWrite({Key? key}) : super(key: key);

  //학생 질문 작성 페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text('제목'),
                    ],
                  ),
                  TextForm(),
                ],
              ),
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
              ),
              child: Column(
                children: [
                  Row(
                    children:  [
                      Text('내용',textAlign: TextAlign.center,),
                    ],
                  ),
                  TextFormField(
                    maxLines: 15,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                //제출버튼
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[900],
                  ),
                  child: const Text(
                    '제출',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                //취소버튼
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[900],
                  ),
                  child: const Text(
                    '취소',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
