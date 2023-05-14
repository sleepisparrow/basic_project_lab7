import 'package:flutter/material.dart';
import 'package:frame/Provider/Prof_quiz_main_provider.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:provider/provider.dart';

class ProfQuizMainPage extends StatefulWidget {
  const ProfQuizMainPage({Key? key}) : super(key: key);

  @override
  State<ProfQuizMainPage> createState() => _ProfQuizMainPageState();
}

class _ProfQuizMainPageState extends State<ProfQuizMainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: dummy data for ui testing. Must remove after.
    ProfQuizMainProvider dummyProvider =
        Provider.of<ProfQuizMainProvider>(context);
    for (int i = 0; i < QuizDummy.quizes.length; i++) {
      dummyProvider.addQuestion(QuizDummy.quizes[i]);
    }

    ProfQuizMainProvider provider = Provider.of<ProfQuizMainProvider>(context);
    List<String> questions = provider.question;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            // shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ColoredBox(
                    color: const Color(0xffe3e5ee),
                    child: SizedBox(
                      height: 80,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                          questions[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

              );
            },
            itemCount: questions.length,
          )),
          const ButtonSet(),
        ],
      ),
    );
  }
}

class ButtonSet extends StatelessWidget {
  const ButtonSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(64, 48),
              backgroundColor: const Color(0xff2296AF),
            ),
            onPressed: () {
              // TODO: 삭제 버튼 누르면 페이지 바꾸기
            },
            child: const Text('삭제'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(64, 48),
              backgroundColor: const Color(0xff2296AF),
            ),
            onPressed: () {
              // TODO:  공개 누르면 페이지 바꾸기
            },
            child: const Text('공개'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(64, 48),
              backgroundColor: const Color(0xff2296AF),
            ),
            onPressed: () {
              // TODO: 추가 버튼 누르면 페이지 바꾸기
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }
}
