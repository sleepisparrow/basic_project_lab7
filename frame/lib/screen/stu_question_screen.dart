import 'package:flutter/material.dart';
import 'package:frame/Page/document_page.dart';
import 'package:frame/Page/question_page.dart';
import 'package:frame/Page/quiz_page.dart';

class StuQuestionScreen extends StatefulWidget {
  const StuQuestionScreen({Key? key}) : super(key: key);

  @override
  State<StuQuestionScreen> createState() => _StuQuestionScreenState();
}

class _StuQuestionScreenState extends State<StuQuestionScreen> {
  //네비게이션 바 인덱스값 1.질문 2.퀴즈 3.피즈백
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    QuestionPage(),
    QuizPage(),
    DocumentPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          '기초프로젝트 랩 6주차',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
            iconSize: 25,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: '질문',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_rounded),
              label: '퀴즈'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.terminal_sharp),
              label: '피드백'
          ),
        ],
      ),
    );
  }
}
