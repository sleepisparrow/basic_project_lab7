import 'package:flutter/material.dart';

const Color darkBlue = Color(0xff11307C);

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 500,
      color: darkBlue,
    );
  }
}