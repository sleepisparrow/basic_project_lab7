import 'package:flutter/material.dart';
import 'package:frame/screen/student/stu_code_screen.dart';
import 'package:frame/screen/professor/pro_classroom_list_screen.dart';
import 'package:frame/screen/signup_screen.dart';
import '../tools/horizontal_line.dart';
import '../tools/need_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false, // bottom overflowed 방지
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HorizontalLine(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  _ImgChaCha(),
                  SizedBox(
                    // 위 아래 위젯 사이 간격 설정
                    height: 50,
                  ),
                  _Input(),
                  SizedBox(
                    height: 20,
                  ),
                  _LoginAndSingup()
                ],
              ),
            ),
            const HorizontalLine(),
          ],
        ),
      ),
    );
  }
}

/// 차차!!!
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

/// 아이디, 비밀번호 InputText
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

/// 로그인, 회원가입 버튼
class _LoginAndSingup extends StatelessWidget {
  const _LoginAndSingup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StuCodeScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NeedColors.lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '로그인(학생)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProClassRoomListScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NeedColors.lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '로그인(교수)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            /**
             * 회원가입 버튼 눌렸을 시, singup_screen으로 이동
             */
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SingupScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NeedColors.lightGrey),
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
