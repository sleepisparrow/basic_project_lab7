import 'package:flutter/material.dart';
import 'package:frame/screen/student/stu_feedback_screen.dart';
import 'package:frame/screen/student/stu_question_screen.dart';
import 'package:frame/screen/student/stu_quiz_screen.dart';
import 'package:frame/screen/student/stu_question_write_screen.dart';

class StuMain extends StatefulWidget {
  const StuMain({Key? key}) : super(key: key);

  @override
  State<StuMain> createState() => _StuMainState();
}

class _StuMainState extends State<StuMain> {
  //네비게이션 바 인덱스값 1.질문 2.퀴즈 3.피드백
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    StuQuestionScreen(),
    StuQuizScreen(),
    StuFeedBackScreen(),
    StuQuestionWrite(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          '과목명(selectedToggle)',
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
      //네비게이션에 따라 변화된 페이지 모습
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: '질문',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.task_rounded), label: '퀴즈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.terminal_sharp), label: '피드백'),
        ],
      ),
    );
  }
}
