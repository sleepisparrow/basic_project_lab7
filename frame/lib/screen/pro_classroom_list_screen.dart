import 'package:flutter/material.dart';

const Color darkBlue = Color(0xff11307C);
const Color lightGrey = Color(0xffE3E5EE);
const Color darkGrey = Color(0xffA2ABCE);

String? className = "기초프로젝트랩"; // 나중에 동적 할당 받아서 넣어줄 예정

class ProClassRoomListScreen extends StatelessWidget {
  const ProClassRoomListScreen({Key? key}) : super(key: key);

  /// 리스트뷰에 의해 IconButton이 가려질 수 있어서, Stack과 Positioned를 사용함
  /// 그러니 코드 복잡한 거 양해좀...
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
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: const [
                    _ClassNameList(),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: _AddIcon(),
                    ),
                  ],
                ),
              ),
              Container(
                /// 화면 길이의 7/10크기 만큼 frame 생성. 이 안에 리스트 뷰 들어갈 예정
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 10) * 7,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: darkBlue,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      color: darkBlue,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: const [
                    _ClassList(),
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

/// 상단에 들어갈 List
/// 리스트 뷰 동적으로 할당 받는 기능 추가할 예정
/// 과목 선택시 윤곽선 처리하는 기능 추가할 예정
/// 현재는 임의로 클래스네임 3개 생성(87~99행까지가 한묶음
class _ClassNameList extends StatelessWidget {
  const _ClassNameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5,),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lightGrey),
            side: MaterialStateProperty.all(const BorderSide(color: darkBlue, width: 2.0)),
          ),
          child: Text(
            className!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 5,),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lightGrey),
          ),
          child: const Text(
            '자료구조',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 5,),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lightGrey),
          ),
          child: const Text(
            '컴프3',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

/// 클래스 룸 생성아이콘
/// 클릭 시 클래스룸 생성 페이지로 이동
class _AddIcon extends StatelessWidget {
  const _AddIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: lightGrey,
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
        onPressed: () {},
        icon: const Icon(Icons.add),
      ),
    );
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
        color: lightGrey,
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
        onPressed: () {},
        icon: const Icon(Icons.create),
      ),
    );
  }
}

/// 중앙에 들어갈 List
/// 리스트 뷰 동적으로 할당 받는 기능 추가할 예정
/// 현재는 임의로 클래스룸 6개 생성(93~128행까지가 한 묶음)
class _ClassList extends StatelessWidget {
  const _ClassList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.05.13',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.05.11',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.03.25',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.03.21',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.03.14',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 16,
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Day: 23.03.13',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '교과명: 기초프로젝트랩',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
