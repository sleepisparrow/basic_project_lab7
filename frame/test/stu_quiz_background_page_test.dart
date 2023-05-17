import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/studnet_quiz_provider.dart';
import 'package:frame/dummy_data/quiz_dummy.dart';
import 'package:frame/screen/stu_quiz_background_page.dart';
import 'package:frame/screen/stu_selection_quiz_widget.dart';
import 'package:frame/screen/stu_tf_quiz_widget.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('퀴즈가 없는 경우 lock 페이지로 돌아가는가(예외처리)', (tester) async {
    // TODO: 테스트 제작하기
  });

  testWidgets('페이지의 문제를 잘 보여주는가', (tester) async {
    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: 0));

    final questionFinder = find.text(QuizDummy.quizes[0].question!);
    expect(questionFinder, findsOneWidget);
  });

  testWidgets('문제가 객관식인 경우, 객관식 모양이 뜨는가', (tester) async {
    const int index = 0;
    // 해당 index가 객관식인가?
    expect(QuizDummy.quizes[index].runtimeType, ChoiceQuiz);

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));

    expect(find.byType(StuSelectionQuizWidget), findsOneWidget);
    expect(find.byType(StuTFQuizWidget), findsNothing);
  });

  testWidgets('문제가 T/F인 경우, T/F 모양이 뜨는가', (tester) async {
    const int index = 1;
    // 해당 index가 TF인가?
    expect(QuizDummy.quizes[index].runtimeType, TFQuiz);

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));

    expect(find.byType(StuSelectionQuizWidget), findsNothing);
    expect(find.byType(StuTFQuizWidget), findsOneWidget);
  });

  // TODO: 이건 selection quiz와 tf_quiz의 test에 넣어야 함
  // testWidgets('선택지 중 다른 선택지를 눌렸을 경우, 기존의 선택지는 삭제되는가?', (tester) async {
  //
  // });

  testWidgets('if next button has cliked, move to next page', (tester) async {
    const int index = 1;

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));

    //test code here
    await tester.tap(find.byKey(const Key('nextButton')));
    await tester.pumpAndSettle();

    expect(find.text(QuizDummy.quizes[index+1].question!), findsOneWidget);
  });

  testWidgets('이전 버튼 누르면 이전으로 돌아가는가 ', (tester) async {
    const int index = 1;

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));

    //test code here
    await tester.tap(find.byKey(const Key('prevButton')));
    await tester.pumpAndSettle();

    expect(find.text(QuizDummy.quizes[index-1].question!), findsOneWidget);
  });

  test('원하는 페이지 위젯을 리턴하는 함수는 잘 작동하는가', () {
    int idx = 1;
    StuQuizBackgroundPage target = UnderBarButtons.getNewPage(idx);
    expect(target.index, idx);
    // 그리고 리펙터링으로 오버로딩하는 함수 만들기(현재에서 +- x만큼)
  });

  test('원하는 페이지 뱉는 함수에서 음수 아니면 indexOut한 경우 예외 처리가 작동하는가', () {
    // TODO 나중에 처리하기
  });

  testWidgets('현재 페이지/총 페이지는 잘 보이는가', (tester) async {
    const int index = 0;

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));
    //start testing
    // ERR: 가능한 논리적 오류: quizes는 quizDummy의 것을 참고함
    String result = '${index+1} / ${QuizDummy.quizes.length}';
    expect(find.text(result), findsOneWidget);
  });

  testWidgets('첫 페이지이면, 이전으로 돌아가는 버튼이 사라져있는가', (tester) async {
    const int index = 0;

    // setting
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));

    // start testing
    expect(find.byKey(const Key('prevButton')), findsNothing);
  });

  testWidgets('마지막 페이지이면, 완료 버튼이 나오는가', (tester) async {
    const int index = 3;
    // ERR: index가 const여야 해서 dummydata로 만들어 질수 있는 최종 개수를 그냥 때려박았다

    // provider 넣기
    await settingForWidgetTesting(tester, const StuQuizBackgroundPage(index: index));
    //start testing

    expect(find.byKey(const Key('nextButton')), findsNothing);
    expect(find.byKey(const Key('finishQuizButton')), findsOneWidget);
  });

  testWidgets('마지막 페이지에서 완료 버튼을 누르면 결과 페이지가 나오는가?', (tester) async {

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

Future settingForWidgetTesting(var tester, Widget targetWidget) async {
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
          return MaterialApp(
            home: targetWidget,
          );
        },
      ),
    ),
  );
}