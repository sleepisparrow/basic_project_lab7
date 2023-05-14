import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

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
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
