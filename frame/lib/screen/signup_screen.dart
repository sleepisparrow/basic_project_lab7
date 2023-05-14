import 'package:flutter/material.dart';
import 'package:frame/screen/login_screen.dart';
import '../tools/horizontal_line.dart';
import '../tools/need_colors.dart';


class SingupScreen extends StatelessWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HorizontalLine(),
            const _SingupManual(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  _Input(),
                ],
              ),
            ),
            const _BtnChoice(),
            const HorizontalLine(),
          ],
        ),
      ),
    );
  }
}

/// 상단의 회원가입 안내 Text
class _SingupManual extends StatelessWidget {
  const _SingupManual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      color: NeedColors.lightGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                '회원가입',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                '아이디(학번), 비밀번호, 이름, 이메일을 입력해주세요.',
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                '학번이 아이디로 지정됩니다.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 학번, 비밀번호, 이름, 이메일 InputText
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
            labelText: '학번',
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
            labelText: '비밀번호',
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: '이름',
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: '이메일',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}

/**
 * 학생 또는 교수 선택 버튼 그리고 회원가입 완료 버튼
 * 학생 선택 시, stuIsPressed가 true
 * 교수 선택 시, proIsPressed가 true
 */
class _BtnChoice extends StatefulWidget {
  const _BtnChoice({Key? key}) : super(key: key);

  @override
  State<_BtnChoice> createState() => _BtnChoiceState();
}

class _BtnChoiceState extends State<_BtnChoice> {
  bool stuIsPressed = false;
  bool proIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    stuIsPressed = !stuIsPressed;
                    proIsPressed = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                  stuIsPressed ? MaterialStateProperty.all(NeedColors.darkBlue) : MaterialStateProperty.all(NeedColors.darkGrey),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  '학생',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    proIsPressed = !proIsPressed;
                    stuIsPressed = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: proIsPressed ? MaterialStateProperty.all(NeedColors.darkBlue) : MaterialStateProperty.all(NeedColors.darkGrey),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  '교수',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 220,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(NeedColors.darkGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '회원가입 완료',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

