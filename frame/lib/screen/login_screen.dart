import 'package:flutter/material.dart';

const Color lightGrey = Color(0xffE3E5EE);
const Color darkBlue = Color(0xff11307C);

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _HorizontalLine(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  _ImgChaCha(),
                  SizedBox(
                    // 50짜리 Interval 생성
                    height: 50,
                  ),
                  _Input(),
                  _Interval20(),
                  _LoginAndSingup()
                ],
              ),
            ),
            const _HorizontalLine(),
          ],
        ),
      ),
    );
  }
}

class _Interval20 extends StatelessWidget {
  const _Interval20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  const _HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 500,
      color: darkBlue,
    );
  }
}

class _ImgChaCha extends StatelessWidget {
  const _ImgChaCha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/chacha_basic_uniform.png',
      width: 200,
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: 'ID',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: 'Password',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}

class _LoginAndSingup extends StatelessWidget {
  const _LoginAndSingup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '로그인',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '회원가입',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
