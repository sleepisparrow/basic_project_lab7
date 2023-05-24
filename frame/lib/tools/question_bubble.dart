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
    return Container(
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: NeedColors.darkBlue, width: 1),
        color: NeedColors.lightGrey,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '제목 : $title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                '내용 : $content',
              ),
            ],
          ),
          // isMe ? IconButton( //나중에 삭제 버튼
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.delete,
          //   ),
          // ): Icon(null),
        ],
      ),
    );
  }
}
