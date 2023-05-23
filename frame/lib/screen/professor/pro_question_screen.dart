import 'package:flutter/material.dart';
import 'package:frame/screen/professor/pro_question_item.dart';
import 'package:provider/provider.dart';

import '../../Provider/pro_question_provider.dart';
import '../../dummy_data/question_dummy.dart';

class ProQuestionScreen extends StatelessWidget {
  const ProQuestionScreen({Key? key}) : super(key: key);

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
              child: ListView.builder(
                itemCount: provider.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProQuestionItem(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
