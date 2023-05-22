import 'package:flutter/material.dart';
import 'package:frame/screen/login_screen.dart';
import '../tools/horizontal_line.dart';
import '../tools/need_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final _authentication = FirebaseAuth.instance;

  ///파이어베이스를 사용할수 있게 해주는 값

  final _formKey = GlobalKey<FormState>();
  String userId = '';
  String userEmail = '';
  String userPassword = '';
  String userName = '';
  bool stuIsPressed = false;
  bool proIsPressed = false;

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

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
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: ValueKey(1),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter at least 4 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userId = value!;
                          },
                          onChanged: (value) {
                            userId = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: '학번',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          key: ValueKey(2),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userPassword = value!;
                          },
                          onChanged: (value) {
                            userPassword = value;
                          },
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
                        TextFormField(
                          key: ValueKey(3),
                          onSaved: (value) {
                            userName = value!;
                          },
                          onChanged: (value) {
                            userName = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: '이름',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey(4),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userEmail = value!;
                          },
                          onChanged: (value) {
                            userEmail = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: '이메일',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
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
                          backgroundColor: stuIsPressed
                              ? MaterialStateProperty.all(NeedColors.darkBlue)
                              : MaterialStateProperty.all(NeedColors.darkGrey),
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
                          backgroundColor: proIsPressed
                              ? MaterialStateProperty.all(NeedColors.darkBlue)
                              : MaterialStateProperty.all(NeedColors.darkGrey),
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
                Container(
                  width: 220,
                  child: GestureDetector(
                    onTap: () async{
                      _tryValidation();
                      try {
                        final newUser = await _authentication
                            .createUserWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );
                        if (newUser.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please check your email and password'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: NeedColors.darkGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '회원가입 완료',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
    return Form(
      child: Column(
        children: [
          TextFormField(
            key: ValueKey(1),
            validator: (value) {
              if (value!.isEmpty || value.length < 4) {
                return 'Please enter at least 4 characters';
              }
              return null;
            },
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
      ),
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
                  backgroundColor: stuIsPressed
                      ? MaterialStateProperty.all(NeedColors.darkBlue)
                      : MaterialStateProperty.all(NeedColors.darkGrey),
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
                  backgroundColor: proIsPressed
                      ? MaterialStateProperty.all(NeedColors.darkBlue)
                      : MaterialStateProperty.all(NeedColors.darkGrey),
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
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
