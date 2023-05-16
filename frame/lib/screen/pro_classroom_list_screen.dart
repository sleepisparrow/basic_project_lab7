import 'package:flutter/material.dart';
import 'package:frame/Provider/pro_classroom_list_provider.dart';
import 'package:frame/screen/pro_create_classroom_screen.dart';
import 'package:frame/screen/pro_question_screen.dart';
import 'package:frame/tools/horizontal_line.dart';
import 'package:provider/provider.dart';
import '../tools/need_colors.dart';

String? className = "기초프로젝트랩"; // 나중에 동적 할당 받아서 넣어줄 예정
int classCount = 0;

class ProClassRoomListScreen extends StatelessWidget {
  const ProClassRoomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
                child: ClassName(),
              ),
              Container(
                /// 화면 길이의 7/10크기 만큼 frame 생성. 이 안에 리스트 뷰 들어갈 예정
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 10) * 7,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: NeedColors.darkBlue,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      color: NeedColors.darkBlue,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: const [
                    ClassListContents(),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: _CreateIcon(),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(), // 간격 추가
        ],
      ),
    ));
  }
}

/// classNameList
/// 오른쪽의 addIcon을 누르고 텍스트 입력 후, '완료'버튼 클릭 시 classNameList에 해당 과목명 추가
class ClassName extends StatefulWidget {
  const ClassName({Key? key}) : super(key: key);

  @override
  State<ClassName> createState() => ClassNameState();
}

class ClassNameState extends State<ClassName> {
  bool vertical = false;
  static List<Widget> classNameList = <Widget>[];
  static List<bool> selectedClassName = <bool>[];

  TextEditingController inputClassName = TextEditingController();
  String stringInputClassName = '';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ToggleButtons with a single selection.
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '교과명을 생성 또는 선택해주세요',
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
            const HorizontalLine(),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < selectedClassName.length; i++) {
                          selectedClassName[i] = i == index;
                        }
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderColor: NeedColors.darkBlue,
                    selectedBorderColor: NeedColors.darkBlue,
                    selectedColor: Colors.white,
                    fillColor: NeedColors.darkBlue,
                    color: Colors.black,
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                    ),
                    isSelected: selectedClassName,
                    children: classNameList,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: NeedColors.lightGrey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: IconButton(
              /// AddIcon 클릭 시 교과명 생성 팝업 등장
              onPressed: () {
                createClassNameDialog(context);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> createClassNameDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('과목 추가'),
            content: SingleChildScrollView(
              child: TextField(
                controller: inputClassName,
                decoration: const InputDecoration(hintText: '추가할 과목명 입력'),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  inputClassName.text = '';
                },
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  classNameList.add(Text("  ${inputClassName.text}  "));
                  selectedClassName.add(false);
                  Navigator.pop(context);
                },
                child: const Text('완료'),
              )
            ],
          );
        });
  }
}

/// 클래스 룸 생성아이콘
/// 클릭 시 클래스룸 생성 페이지로 이동
class _CreateIcon extends StatelessWidget {
  const _CreateIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NeedColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateClassroom()),
          );
        },
        icon: const Icon(Icons.create),
      ),
    );
  }
}

class ClassListContents extends StatefulWidget {
  const ClassListContents({Key? key}) : super(key: key);

  @override
  State<ClassListContents> createState() => ClassListContentsState();
}

class ClassListContentsState extends State<ClassListContents> {
  @override
  Widget build(BuildContext context) {
    int selectedClassNameItemNum =
        Provider.of<ProClassRoomList>(context).itemCount;

    return Builder(builder: (context) {
      if (selectedClassNameItemNum == 0) {
        return const Center(
          child: Text('클래스룸을 생성해주세요'),
        );
      } else {
        return ListView.builder(
          itemCount: selectedClassNameItemNum,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProQuestionScreen()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: NeedColors.darkGrey, width: 1),
                      color: NeedColors.lightGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "생성일 : ${Provider.of<ProClassRoomList>(context).createDate[index]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Provider.of<ProClassRoomList>(context)
                                .dropDownSelectedClassName,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }
}

/// 중앙에 들어갈 List
/// 리스트 뷰 동적으로 할당 받는 기능 추가할 예정
/// 현재는 임의로 클래스룸 6개 생성(93~128행까지가 한 묶음)
