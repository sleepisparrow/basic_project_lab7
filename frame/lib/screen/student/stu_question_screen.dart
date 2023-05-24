import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frame/Provider/stu_question_provider.dart';
import 'package:frame/screen/student/stu_create_question_screen.dart';
import 'package:frame/tools/question_bubble.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../tools/need_colors.dart';

class StuQuestionScreen extends StatelessWidget {
  const StuQuestionScreen({Key? key}) : super(key: key);

  ///네비게이션바의 질문눌렀을때 질문페이지
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; ///firebase 에서 userid 확인을 위한 변수
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(       ///firebase 연동 가져올 폴더지정
                  stream: FirebaseFirestore.instance
                      .collection('room/gwZyIGV4iDrQVkX7zMTW/question')
                      .orderBy('time')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final chatDocs = snapshot.data!.docs;  ///경로 저장
                    return ListView.builder(        ///firebase에 저장된 데이터 보여주기
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: chatDocs.length,
                      itemBuilder: (context, index) {
                        return QuestionBubble(chatDocs[index]['title'],chatDocs[index]['content'],chatDocs[index]['userId'].toString() ==user!.uid);
                      },
                    );
                  },
                ),
              ),
              Padding(
                ///글작성 아이콘
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _CreateIcon(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StuQuestionList extends StatefulWidget {
  const StuQuestionList({Key? key}) : super(key: key);

  @override
  State<StuQuestionList> createState() => _StuQuestionListState();
}

class _StuQuestionListState extends State<StuQuestionList> {
  @override
  Widget build(BuildContext context) {
    StuQuestionProvider provider = Provider.of<StuQuestionProvider>(context);
    int questionCount = provider.questionTitle.length;
    List<String> title = provider.questionTitle;
    List<String> contents = provider.questionContents;

    CollectionReference product = FirebaseFirestore.instance.collection('room');

    return Builder(builder: (context) {
      if (questionCount == 0) {
        return Center(
          child: Text("교수님께 질문해주세요"),
        );
      } else {
        return ListView.builder(
          itemCount: questionCount,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border:
                              Border.all(color: NeedColors.darkBlue, width: 1),
                          color: NeedColors.lightGrey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                              child: Text(
                                '제목 : ${title[index]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Text(
                                '내용 : ${contents[index]}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  top: 0,
                  child: _NotAnswered(),
                ),
              ],
            );
          },
        );
      }
    });
  }
}

class _NotAnswered extends StatelessWidget {
  const _NotAnswered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('answered'),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '답변\n대기',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _CreateIcon extends StatelessWidget {
  const _CreateIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NeedColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "질문 작성",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                actions: [
                  StuCreateQuestion(),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.create),
      ),
    );
  }
}
