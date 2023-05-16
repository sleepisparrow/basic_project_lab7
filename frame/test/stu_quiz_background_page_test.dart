import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/studnet_quiz_provider.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:frame/screen/stu_quiz_background_page.dart';
import 'package:frame/screen/stu_selection_quiz_widget.dart';
import 'package:frame/screen/stu_tf_quiz_widget.dart';
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

  testWidgets('문제가 객관식인 경우, 객관식 모양이 뜨는가', (tester) async {
    const int index = 0;
    // 해당 index가 객관식인가?
    expect(QuizDummy.quizes[0].runtimeType, ChoiceQuiz);

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
            return const StuQuizBackgroundPage(index: index);
          },
        ),
      ),
    );

    expect(find.byType(StuSelectionQuizWidget), findsOneWidget);
    expect(find.byType(StuTFQuizWidget), findsNothing);
  });

  testWidgets('문제가 T/F인 경우, T/F 모양이 뜨는가', (tester) async {
    const int index = 0;
    // 해당 index가 객관식인가?
    expect(QuizDummy.quizes[0].runtimeType, ChoiceQuiz);

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
            return const StuQuizBackgroundPage(index: index);
          },
        ),
      ),
    );

    expect(find.byType(StuSelectionQuizWidget), findsNothing);
    expect(find.byType(StuTFQuizWidget), findsOneWidget);
  });

  // TODO: 이건 selection quiz와 tf_quiz의 test에 넣어야 함
  // testWidgets('선택지 중 다른 선택지를 눌렸을 경우, 기존의 선택지는 삭제되는가?', (tester) async {
  //
  // });

  testWidgets('다음 버튼을 누르면 다음으로 넘어가는가', (tester) async {
    // TODO: 테스트 제작하기
  });

  test('getSelectionBox는 잘 작동하는가?', () {
    StuQuizBackgroundPage page = const StuQuizBackgroundPage(index: -1);
    Quiz selectionQuiz = ChoiceQuiz(question: 'selection', selections: ['','','',''], answer: 0);
    Quiz tfQuiz = TFQuiz(question: 'tf', answer: 1);
    expect(page.getSelectionBox(selectionQuiz).runtimeType, StuSelectionQuizWidget);
    expect(page.getSelectionBox(tfQuiz).runtimeType, StuTFQuizWidget);
  });
}

void setProvider(BuildContext context) {
  StudentQuizProvider provider = Provider.of<StudentQuizProvider>(context);

  for (int i = 0; i < QuizDummy.quizes.length; i++) {
    provider.addQuestion(QuizDummy.quizes[i]);
  }
}
