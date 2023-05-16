import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/studnet_quiz_provider.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:frame/screen/stu_quiz_background_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('퀴즈가 없는 경우 lock 페이지로 돌아가는가', (tester) async {
    // TODO: 테스트 제작하기
  });


  testWidgets('페이지의 문제를 잘 보여주는가', (tester) async {
    // provider 넣기
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<StudentQuizProvider>(
              create: (_) => StudentQuizProvider()),
        ],
        child: Builder(
          builder: (BuildContext context) {
            var provider = Provider.of<StudentQuizProvider>(context);
            for (int i = 0; i < QuizDummy.quizes.length; i++) {
              provider.addQuestion(QuizDummy.quizes[i]);
            }
            // The builder function must return a widget.
            return const StuQuizBackgroundPage(index: 0);
          },
        ),
      ),
    );

    final questionFinder = find.text(QuizDummy.quizes[0].question!);
    expect(questionFinder, findsOneWidget);
  });


  testWidgets('다음 버튼을 누르면 다음으로 넘어가는가', (tester) async {
    // TODO: 테스트 제작하기
  });
}

void setProvider(BuildContext context) {
  StudentQuizProvider provider = Provider.of<StudentQuizProvider>(context);

  for (int i = 0; i < QuizDummy.quizes.length; i++) {
    provider.addQuestion(QuizDummy.quizes[i]);
  }
}
