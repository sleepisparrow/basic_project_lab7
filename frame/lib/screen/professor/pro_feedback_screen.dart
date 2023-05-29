

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_feedback_provider.dart';
import 'package:frame/tools/need_colors.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    ProfFeedbackProvider provider = context.read<ProfFeedbackProvider>();

    Future<AggregateQuerySnapshot> count1 = FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .where('level', isEqualTo: 1)
        .count()
        .get();
    Future<AggregateQuerySnapshot> count2 = FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .where('level', isEqualTo: 2)
        .count()
        .get();
    Future<AggregateQuerySnapshot> count3 = FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .where('level', isEqualTo: 3)
        .count()
        .get();
    Future<AggregateQuerySnapshot> count4 = FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .where('level', isEqualTo: 4)
        .count()
        .get();
    Future<AggregateQuerySnapshot> count5 = FirebaseFirestore.instance
        .collection('room/gwZyIGV4iDrQVkX7zMTW/feedback')
        .where('level', isEqualTo: 5)
        .count()
        .get();

    List<int> num = [];

    int level1;
    int level2;
    int level3;
    int level4;
    int level5;

    final def = FirebaseFirestore.instance
        .collection('room/${code}/feedback')
        .doc('default');
    const BorderSide blueBorder = BorderSide(
      width: 2,
      color: Color(0xff11307c),
    );

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              FutureBuilder<AggregateQuerySnapshot>(///난이도가 1인 사람의 수
                  future: count1,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('0');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      int docCount = snapshot.data!.count;
                      level1 = docCount;
                      num.add(level1);
                      provider.setChoice(0, docCount);
                    }

                    return Text('');
                  }),
              FutureBuilder<AggregateQuerySnapshot>(
                ///난이도가 2인 사람의 수
                  future: count2,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('0');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      int docCount = snapshot.data!.count;
                      level2 = docCount;
                      num.add(level2);
                      provider.setChoice(1, docCount);
                    }

                    return Text('');
                  }),
              FutureBuilder<AggregateQuerySnapshot>(
                ///난이도가 3인 사람의 수
                  future: count3,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('0');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      int docCount = snapshot.data!.count;
                      level3 = docCount;
                      num.add(level3);
                      provider.setChoice(2, docCount);

                    }

                    return Text('');
                  }),
              FutureBuilder<AggregateQuerySnapshot>(
                ///난이도가 4인 사람의 수
                  future: count4,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('0');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      int docCount = snapshot.data!.count;
                      level4 = docCount;
                      num.add(level4);
                      provider.setChoice(3, docCount);
                    }
                    return Text('');
                  }),
              FutureBuilder<AggregateQuerySnapshot>(
                ///난이도가 5인 사람의 수
                  future: count5,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('0');
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      int docCount = snapshot.data!.count;
                      level5 = docCount;
                      num.add(level5);
                      provider.setChoice(4, docCount);
                    }
                    return Text('');
                  }),
            ],
          ),      ///난이도 수

           SizedBox(height:300,child:_PieGraph()),
          const Center(
            child: Text(
              '5: 매우 어려움/4: 어려움/3: 보통/2:쉬움/1: 아주 쉬움',
              style: TextStyle(fontSize: 12),

            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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

                  print(num);
                  ///경로 저장
                  return ListView.builder(
                    ///firebase에 저장된 데이터 보여주기
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7.5),
                    itemCount: chatDocs.length,
                    itemBuilder: (context, index) {
                      ///난이도 수 구하기 차후 대비책
                      // if(chatDocs[index]['level']==1){
                      //   def.update(
                      //       {'1':FieldValue.increment(1)});
                      // }
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 8.0, 3.0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: NeedColors.lightGrey,
                            border: Border.all(
                              color: NeedColors.darkGrey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '익명${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  chatDocs[index]['text'],
                                  style: TextStyle(),
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
  const _PieGraph( {Key? key}) : super(key: key);


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
