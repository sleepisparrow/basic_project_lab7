import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/quiz_result_provider.dart';
import 'package:frame/tools/quiz_result_chart_generator.dart';
import 'package:provider/provider.dart';

void main() {
  test('if data given, getChartData makes good data for chart?', () {
    List<int> selectionData = [60, 40];
    List<QuizResultChartData> data = getChartData(selectionData, ['true', 'false']);
    expect(data.length, 2);
    expect(data[0].name, 'true');
    expect(data[0].weight, 60);
  });

  test('getChartData에서 입력 된 파라미터의 length가 다르면 예외 처리하는가', () {
    expect(() => getChartData(List.empty(), ['error']), throwsRangeError);
  });

  testWidgets('그래프는 provider가 제공한 데이터를 잘 표시하는가', (tester) async {
    // 실제로 테스트 해볼 것
  });

  testWidgets('그래프는 provider가 제공한 데이터를 실시간적으로 처리하는가', (tester) async {
    // 예상 해결법: watch 를 사용해서 or select를 사용해서 문제를 해결한다.
    // 이것도 실제로 테스트 해봐야 하나?
  });

  // 그래프의 radius가 잘 적용되어서 끝이 완벽히 둥근가?
  // 그래프의 굵기가 너무 굵지는 않은가?
  // 애니메이션은 제거되었는가?
}

Future settingForWidgetTesting(var tester, Widget targetWidget) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizResultProvider>(
            create: (_) => QuizResultProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          // have to make dummy data generator
          QuizResultProvider provider = context.read<QuizResultProvider>();
          provider.answerList[0] = 60;
          provider.answerList[1] = 40;

          // The builder function must return a widget.
          return MaterialApp(
            home: targetWidget,
          );
        },
      ),
    ),
  );
}
