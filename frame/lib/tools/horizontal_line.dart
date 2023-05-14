import 'package:flutter/material.dart';
import '../tools/need_colors.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: MediaQuery.of(context).size.width,
      color: NeedColors.darkBlue,
    );
  }
}