import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/pro_question_provider.dart';
import 'package:frame/dummy_data/question_dummy.dart';
import 'package:frame/screen/professor/pro_question_item.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('주어진 데이터를 잘 표시하는가?', (tester) async {
    QuestionData data = QuestionDummy.questions[0];
    ProQuestionProvider provider = await preSetting<ProQuestionProvider>(
      tester,
      ProQuestionItem(index: 0),
      ProQuestionProvider(),
    );

    expect(find.text('제목 : ${data.title}'), findsOneWidget);
    expect(find.text('내용 : ${data.content}'), findsOneWidget);
    expect(find.byKey(const Key('not answered')), findsOneWidget);
    expect(find.byKey(const Key('answered')), findsNothing);
    expect(find.byKey(const Key('answered button')), findsOneWidget);
  });

  testWidgets('답변 완료 버튼이 눌렸을 때, UI가 변경되는가', (tester) async {
    ProQuestionProvider provider = await preSetting<ProQuestionProvider>(
      tester,
      ProQuestionItem(index: 0),
      ProQuestionProvider(),
    );

    await tester.tap(find.byKey(const Key('answered button')));
    await tester.pump();

    expect(find.byKey(const Key('not answered')), findsNothing);
    expect(find.byKey(const Key('answered')), findsOneWidget);
    expect(find.byKey(const Key('answered button')), findsNothing);
  });

  testWidgets('답변 완료 버튼이 눌렸을 때, provider의 상태가 바뀌는가', (tester) async {
    ProQuestionProvider provider = await preSetting<ProQuestionProvider>(
      tester,
      ProQuestionItem(index: 0),
      ProQuestionProvider(),
    );

    await tester.tap(find.byKey(const Key('answered button')));
    await tester.pump();

    expect(provider.questions[0].answered, true);
  });
}

/// presetting 범용 버전:
/// await로 호출할 것을 강력히 추천
///
/// T: Provider type임
/// tester: widgetTest할 때 사용되는 애 넣으면 됨
/// targetWidget: 테스트하고자 하는 위젯 넣으면 됨
/// provider: Provider를 슬프지만, 직접 생성해서 넣어야 됨
///
/// return: 이걸 테스트할 때 사용할 수 있는 provider가 제공됨
Future<T> preSetting<T extends ChangeNotifier>(
    var tester, var targetWidget, T provider) async {
  late T ret;
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<T>(create: (_) => provider),
      ],
      child: Builder(
        builder: (BuildContext context) {
          ret = Provider.of<T>(context);
          // The builder function must return a widget.
          return MaterialApp(
            home: targetWidget,
          );
        },
      ),
    ),
  );
  return ret;
}
