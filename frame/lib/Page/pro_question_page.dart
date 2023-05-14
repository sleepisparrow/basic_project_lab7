import 'package:flutter/material.dart';
import 'package:frame/screen/stu_question_write_screen.dart';

class ProQuestionPage extends StatelessWidget {
  const ProQuestionPage({Key? key}) : super(key: key);

  //네비게이션바의 질문눌렀을때 질문페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.border_color_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StuQuestionWrite(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        ///코드 번호
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Text('7878',style: TextStyle(color: Colors.white),),
            ),
            ///질문 리스트
            RecentContainer(),
            RecentContainer(),
            RecentContainer(),
          ],
        ),
      ),
    );
  }

  Container RecentContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Empty'),
            ],
          ),
          Row(
            children: const [
              Text('title'),
            ],
          ),
        ],
      ),
    );
  }
}
