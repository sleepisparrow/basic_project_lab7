import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/quiz_finish_provider.dart';
import 'package:frame/screen/student/stu_result_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('provider에 의해 값이 제공되면 실시간적으로 update 되는가', (tester) async {
    QuizFinishProvider provider = await settingForWidgetTesting(tester, StuQuizResultScreen());
    expect(find.text('테스트가 종료될 때까지 잠시만 기다려주세요'), findsOneWidget);
    provider.isQuizFinished = true;
    await tester.pump();
    expect(find.text('결과 페이지'), findsOneWidget);
  });
}

Future settingForWidgetTesting(var tester, Widget targetWidget) async {
  late QuizFinishProvider provider;
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizFinishProvider>(
            create: (_) => QuizFinishProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          provider = Provider.of<QuizFinishProvider>(context);
          // 기본값이 false이므로 상관없을 거 같음
          // The builder function must return a widget.
          return MaterialApp(
            home: targetWidget,
          );
        },
      ),
    ),
  );
  return provider;
}