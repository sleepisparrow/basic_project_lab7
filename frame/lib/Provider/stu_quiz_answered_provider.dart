import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:frame/tools/room_uid.dart';

class StuQuizAnsweredProvider extends ChangeNotifier {
  bool? isAnswered;
  final _collection = FirebaseFirestore.instance
      .collection('room')
      .doc(RoomUid.roomid)
      .collection('QuizSubmited');

  Future<bool> getIsAnswered() async {
    // 여기에서 fb 답 여부 확인하기
    // 1. 현재 uid 가져오기
    final uid = FirebaseAuth.instance.currentUser?.uid;
    // 2. 현재 uid의 이름을 가지는 doc 있는지 확인하기
    var doc = await _collection.doc(uid).get();
    isAnswered = doc.exists;

    notifyListeners();
    return isAnswered!;
    // 3. 2를 세팅하고 리턴하기
  }

  void initialize() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    // 2. 현재 uid의 이름을 가지는 doc 있는지 확인하기
    _collection.snapshots().listen((event) {
      var tmp = event.docs;
      for(int i = 0; i < tmp.length; i++) {
        if (tmp[i].id == uid) {
          isAnswered = true;
          break;
        }
        isAnswered = false;
      }
      notifyListeners();
    });
  }

  void setIsAnsweredTrue() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    // 여기에서 fb 새 문서 만들기
    _collection.doc(uid).set({'dummy': true}).then((value){ isAnswered = true;
    notifyListeners();});
    // 그리고 isAnswered true 로 만들기
  }

  Future resetData() async {
    var snapshots = await _collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
