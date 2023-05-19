import 'package:flutter/material.dart';
import 'package:frame/screen/student/stu_main.dart';
import 'package:frame/tools/horizontal_line.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:frame/tools/textform.dart';


//코드 입력화면
class StuCodeScreen extends StatelessWidget {
  const StuCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const HorizontalLine(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: NeedColors.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text('코드입력'),
                          ],
                        ),
                        const TextForm(),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const StuMain()),
                              );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 200),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: NeedColors.darkBlue,
                            ),
                            child: const Text(
                              '접속',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),


                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    decoration: const BoxDecoration(
                      color: NeedColors.lightGrey,
                      border: Border(
                        top: BorderSide(
                          color: Color(0xff11307C),
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Color(0xff11307C),
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Color(0xff11307C),
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text('과목명'),
                  ),
                  const HorizontalLine(),
                  const SizedBox(
                    height: 5,
                  ),
                  const RecentContainer(),
                  const RecentContainer(),
                  const RecentContainer(),
                  const HorizontalLine(),

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

// 최근입장한 글들 보여주는 컨테이너
class RecentContainer extends StatelessWidget {
  const RecentContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: const BoxDecoration(
        color: NeedColors.lightGrey,
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Empty'),
            ],
          ),
          Row(
            children: const [
              Text('title'),
            ],
          ),
        ],
      ),
    );
  }
}
