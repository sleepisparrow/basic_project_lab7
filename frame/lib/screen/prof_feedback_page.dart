import 'package:flutter/material.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';
import 'package:provider/provider.dart';

class ProfFeedbackPage extends StatefulWidget {
  const ProfFeedbackPage({Key? key}) : super(key: key);

  @override
  State<ProfFeedbackPage> createState() => ProfFeedbackPageState();
}

class ProfFeedbackPageState extends State<ProfFeedbackPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfFeedbackProvider provider = Provider.of<ProfFeedbackProvider>(context);
    List<String> feedback = provider.feedback;

    // TODO: 이에 대한 위젯 테스트 작성하기
    if(feedback.isEmpty) {
      feedback.add('아직 아무런 메시지가 없습니다.');
    }

    return Placeholder(
      child: Center(
          child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Text(feedback[index]),
              ],
            )
          );
        },
        itemCount: feedback.length,
      )),
    );
  }
}
