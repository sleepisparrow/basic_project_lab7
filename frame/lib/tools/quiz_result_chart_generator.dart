import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Provider/quiz_provider.dart';
import '../Provider/quiz_result_provider.dart';

class QuizResultChartGenerator extends StatefulWidget {
  const QuizResultChartGenerator({Key? key}) : super(key: key);

  @override
  State<QuizResultChartGenerator> createState() =>
      _QuizResultChartGeneratorState();
}

class _QuizResultChartGeneratorState extends State<QuizResultChartGenerator> {
  final selectionList = ['true', 'false'];

  @override
  Widget build(BuildContext context) {

    QuizProvider provider = context.watch<QuizProvider>();
    final List<QuizResultChartData> data =
        getChartData([provider.trueCount, provider.falseCount], ['true', 'false']);

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: CategoryAxis(
        isVisible: false,
      ),
      series: <BarSeries<QuizResultChartData, String>>[
        BarSeries<QuizResultChartData, String>(
          dataSource: data,
          xValueMapper: (QuizResultChartData d, _) => d.name,
          yValueMapper: (QuizResultChartData d, _) => d.weight,
          dataLabelSettings: const DataLabelSettings(
              labelPosition: ChartDataLabelPosition.inside, isVisible: true),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(100),
              topRight: Radius.circular(100)),
          width: 0.5,
          spacing: 0.3,
        )
      ],
    );
  }
}

class QuizResultChartData {
  final double xValue;
  final String name;
  final double weight;

  QuizResultChartData(this.xValue, this.name, this.weight);
}

List<QuizResultChartData> getChartData(
    List<int> selections, List<String> name) {
  if (selections.length != name.length) {
    throw RangeError(
        'length of selection[${selections.length}] and name[${name.length}] are different');
  }
  List<QuizResultChartData> ret = List.empty(growable: true);

  for (int i = 0; i < name.length; i++) {
    ret.add(
        QuizResultChartData(i.toDouble(), name[i], selections[i].toDouble()));
  }

  return ret;
}
