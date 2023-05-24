import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';

class QuestionBubble extends StatelessWidget {
  const QuestionBubble(this.title, this.content, this.isMe, {Key? key})
      : super(key: key);

  final String title;
  final String content;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    ///질문들 감싸는 디자인
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
                        '제목 : ${title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Text(
                        '내용 : ${content}',
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
  }
}

class _NotAnswered extends StatefulWidget {
  const _NotAnswered({Key? key}) : super(key: key);

  @override
  State<_NotAnswered> createState() => _NotAnsweredState();
}

class _NotAnsweredState extends State<_NotAnswered> {


  @override
  Widget build(BuildContext context) {

    String answered_text = "답변\n대기";
    // 답변 완료 상태가 되면 "답변\n완료"로 변경
    Color answered_color = Colors.red;
    // 답변 완료 상태가 되면 Colors.green 으로 변경

    return Container(
      key: const Key('answered'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: answered_color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          answered_text,
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
