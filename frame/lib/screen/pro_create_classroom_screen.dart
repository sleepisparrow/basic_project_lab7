import 'package:flutter/material.dart';
import 'package:frame/screen/pro_classroom_list_screen.dart';
import 'package:intl/intl.dart';

class CreateClassroom extends StatelessWidget {
  const CreateClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 10) * 8,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.darkBlue,
                      width: 3.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.darkBlue,
                      width: 3.0,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _Input(),
                    _CancelOrCheck()
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

/// 교과명 생성일(자동생성), 교과명 선택 위젯
class _Input extends StatefulWidget {
  const _Input({Key? key}) : super(key: key);

  @override
  State<_Input> createState() => _InputState();
}

/// DropdownButton에 들어갈 리스트를 동적으로 할당하는 기능 추가해야함
/// DropdownButton을 이용하여 선택한 교과명과
/// 자동으로 할당된 날짜가 pro_classroom_list_screen의 리스트에 나타나게 해야함
class _InputState extends State<_Input> {
  final _selectList = ['기초프로젝트랩', '자료구조', '컴프3'];
  // ignore: prefer_typing_uninitialized_variables
  var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'asset/chacha_basic_uniform.png',
          width: 200,
        ),

        /// 생성일
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text('교과명 생성일(자동 생성됨)'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.darkGrey,
                    ),
                  ),
                  labelText: 'Today : ${DateFormat('yyyy-MM-dd')
                          .format(DateTime.now())}',
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text('교과명을 선택하세요'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: DropdownButton(
                          isExpanded: true,
                          hint: const Text('교과명 선택'),
                          value: _selectedValue,
                          items: _selectList.map(
                            (value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

/// 취소, 확인 버튼
/// 확인을 눌렀을 때, 생성된 방 정보를 pro_classroom_list_screen의 리스트에 추가하는 기능 추가해야함
class _CancelOrCheck extends StatelessWidget {
  const _CancelOrCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProClassRoomListScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '취소',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),

        const SizedBox(width: 30),

        SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProClassRoomListScreen()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGrey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              '확인',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
