import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frame/screen/professor/pro_question_item.dart';
import 'package:frame/tools/question_bubble.dart';
import 'package:provider/provider.dart';

import '../../Provider/pro_question_provider.dart';
import '../../dummy_data/question_dummy.dart';

class ProQuestionScreen extends StatefulWidget {
  const ProQuestionScreen({Key? key}) : super(key: key);

  @override
  State<ProQuestionScreen> createState() => _ProQuestionScreenState();
}

class _ProQuestionScreenState extends State<ProQuestionScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final code = 'gwZyIGV4iDrQVkX7zMTW';
  ///네비게이션바의 질문눌렀을때 질문페이지
  @override
  Widget build(BuildContext context) {
    // TODO: dummy data
    ProQuestionProvider dummyGenerator =
        Provider.of<ProQuestionProvider>(context);
    dummyGenerator.questions.add(QuestionDummy.questions[0]);

    ProQuestionProvider provider = context.watch<ProQuestionProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),

        ///코드 번호
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Text(
                '7878',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                ///firebase 연동 가져올 폴더지정
                stream: FirebaseFirestore.instance
                    .collection('room/${code}/question')
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
                  final chatDocs = snapshot.data!.docs;

                  ///경로 저장
                  return ListView.builder(
                    ///firebase에 저장된 데이터 보여주기
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemCount: chatDocs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          FirebaseFirestore.instance.doc('room/${code}/question/${chatDocs[index].reference.id}').update({'answer':!chatDocs[index]['answer']});
                          print(chatDocs[index].reference.id);
                        },
                        child: QuestionBubble(
                          chatDocs[index]['title'],
                          chatDocs[index]['content'],
                          chatDocs[index]['userId'].toString() == user!.uid,
                          chatDocs[index]['answer'],

                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
