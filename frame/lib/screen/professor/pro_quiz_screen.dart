import 'package:flutter/material.dart';
import 'package:frame/tools/need_colors.dart';

class ProQuizScreen extends StatelessWidget {
  const ProQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LockIcon(),
            SizedBox(
              height: MediaQuery.of(context).size.height/30,
            ),
            Column(
              children: [
                QuizResult(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      QuizInitButton(),
                      SizedBox(
                        width: 5,
                      ),
                      QuizResultButton(),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LockIcon extends StatefulWidget {
  const LockIcon({Key? key}) : super(key: key);

  @override
  State<LockIcon> createState() => _LockIconState();
}

class _LockIconState extends State<LockIcon> {
  IconData currentIcon = Icons.lock;
  bool btn_lockInfo = false;
  String text_lockInfo = "상태 열림";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          btn_lockInfo = !btn_lockInfo;
          if (btn_lockInfo) {
            currentIcon = Icons.lock_open;
            text_lockInfo = "상태 : 열림";
          } else {
            currentIcon = Icons.lock;
            text_lockInfo = "상태 : 닫힘";
          }
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(NeedColors.blueGreen),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
      ),
      child: Column(
        children: [
          Icon(
            currentIcon,
            size: MediaQuery.of(context).size.width / 5 * 4,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              text_lockInfo,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizResult extends StatefulWidget {
  const QuizResult({Key? key}) : super(key: key);

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  Widget data = Text("No data");

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 7,
        minWidth: MediaQuery.of(context).size.width - 40,
        maxWidth: MediaQuery.of(context).size.width - 40,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: NeedColors.darkBlue, width: 3.0)),
      child: Center(child: data),
      /// 결과 확인 버튼 누르면 data를 그래프로 변경
    );
  }
}

/// 버튼 클릭시 데이터 초기화 필요
class QuizInitButton extends StatelessWidget {
  const QuizInitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(NeedColors.lightBlue),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Text("초기화"),
      ),
    );
  }
}

/// 버튼 클릭시 데이터를 그래프로 변경
class QuizResultButton extends StatelessWidget {
  const QuizResultButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(NeedColors.lightBlue),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Text("결과 확인"),
      ),
    );
  }
}
