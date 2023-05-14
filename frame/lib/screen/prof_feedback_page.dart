import 'package:flutter/material.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../dummy_data/feedback_dummy.dart';

class ProfFeedbackPage extends StatefulWidget {
  const ProfFeedbackPage({Key? key}) : super(key: key);

  @override
  State<ProfFeedbackPage> createState() => ProfFeedbackPageState();
}

class ProfFeedbackPageState extends State<ProfFeedbackPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: 이 부분은 provider를 이용해 더미 데이터를 보여주기 위한 코드이므로 삭제할 것
    ProfFeedbackProvider dummyGenerator =
        Provider.of<ProfFeedbackProvider>(context);
    dummyGenerator.choices = FeedbackDummy.choices;
    for (int i = 0; i < FeedbackDummy.feedback.length; i++) {
      dummyGenerator.addFeedback(FeedbackDummy.feedback[i]);
    }

    ProfFeedbackProvider provider = Provider.of<ProfFeedbackProvider>(context);

    final List<String> feedback = provider.feedback;

    final List<_ChartData> data = makeToChartData(provider.choices);

    return Scaffold(
      body: Column(
        children: [
          SfCircularChart(
            title: ChartTitle(
              text: '난이도',
            ),
            series: <CircularSeries>[
              PieSeries<_ChartData, String>(
                dataSource: data,
                pointColorMapper: (_ChartData d, _) => d.color,
                xValueMapper: (_ChartData d, _) => d.title,
                yValueMapper: (_ChartData d, _) => d.weight,
                dataLabelMapper: (_ChartData d, _) => d.title,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            height: MediaQuery.of(context).size.height * 2 / 3,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2,
                  color: Color(0xff11307c),
                ),
                right: BorderSide(
                  width: 2,
                  color: Color(0xff11307c),
                ),
                top: BorderSide(
                  width: 2,
                  color: Color(0xff11307c),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 7.5),
                  child: ColoredBox(
                    color: const Color(0xffe3e5ee),
                    child: SizedBox(
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            feedback[index],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )),
                  ),
                );
              },
              itemCount: feedback.length,
            ),
          )
        ],
      ),
    );
  }

  List<_ChartData> makeToChartData(List<int> info) {
    List<_ChartData> ret = List.empty(growable: true);
    for (int i = 0; i < info.length; i++) {
      ret.add(_ChartData('${i + 1}', info[i] as double,
          _ChartData.defaultColorPalette[4 - i]));
    }
    return ret;
  }
}

class _ChartData {
  _ChartData(this.title, this.weight, [this.color = Colors.white]);

  final String title;
  final double weight;
  final Color color;

  static final List<Color> defaultColorPalette = [
    const Color(0x0011307c),
    const Color(0x004553a5),
    const Color(0x007078d0),
    const Color(0x009ca1fc),
    const Color(0x00c8cbff)
  ];
}
