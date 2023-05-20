import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StuQuizLockedScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('퀴즈는 아직 공개되지 않았습니다.'),
              SizedBox(
                height: 50,
              ),
              _ImgLock(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImgLock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'asset/lock-outline.png',
      width: 150,
      height: 150,
    );
  }

}