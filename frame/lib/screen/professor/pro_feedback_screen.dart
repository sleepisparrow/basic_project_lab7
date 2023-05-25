import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../dummy_data/feedback_dummy.dart';

class ProfFeedbackScreen extends StatefulWidget {
  const ProfFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<ProfFeedbackScreen> createState() => ProfFeedbackScreenState();
}

class ProfFeedbackScreenState extends State<ProfFeedbackScreen> {
  final code = 'gwZyIGV4iDrQVkX7zMTW';

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
    const BorderSide blueBorder = BorderSide(
      width: 2,
      color: Color(0xff11307c),
    );

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 300, child: _PieGraph()),
          const Center(
            child: Text(
              '5: 매우 어려움/4: 어려움/3: 보통/2:쉬움/1: 아주 쉬움',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  left: blueBorder,
                  right: blueBorder,
                  top: blueBorder,
                ),
              ),
              child: StreamBuilder(
                ///firebase 연동 가져올 폴더지정
                stream: FirebaseFirestore.instance
                    .collection('room/${code}/feedback')
                    .orderBy('time')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final chatDocs = snapshot.data!.docs;

                  ///경로 저장
                  return ListView.builder(
                    ///firebase에 저장된 데이터 보여주기
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 7.5),
                    itemCount: chatDocs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(6.0, 12.0, 6.0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: NeedColors.darkBlue,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '익명${index}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                ),
                                Text(
                                  chatDocs[index]['text'],
                                  style: TextStyle(
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedbackList extends StatelessWidget {
  const _FeedbackList(
      {Key? key,
      required this.context,
      required this.index,
      required this.feedback})
      : super(key: key);

  final BuildContext context;
  final int index;
  final List<String> feedback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7.5),
      child: ColoredBox(
        color: const Color(0xffe3e5ee),
        child: SizedBox(
            height: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                feedback[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )),
      ),
    );
  }
}

class _PieGraph extends StatelessWidget {
  const _PieGraph({Key? key}) : super(key: key);

  List<_ChartData> makeToChartData(List<int> info) {
    List<_ChartData> ret = List.empty(growable: true);
    for (int i = 0; i < info.length; i++) {
      ret.add(_ChartData('${i + 1}', info[i].toDouble(),
          _ChartData.defaultColorPalette[4 - i]));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    ProfFeedbackProvider provider = Provider.of<ProfFeedbackProvider>(context);
    final List<_ChartData> data = makeToChartData(provider.choices);

    return SfCircularChart(
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
    );
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
