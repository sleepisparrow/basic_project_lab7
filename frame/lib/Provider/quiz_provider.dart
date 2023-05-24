import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frame/tools/room_uid.dart';

class QuizProvider extends ChangeNotifier {
  final _document = FirebaseFirestore.instance
      .collection('room')
      .doc(RoomUid.roomid)
      .collection('Quiz')
      .doc('default');

  late bool locked = false, reseted;
  late int trueCount = 0, falseCount = 0;

  Future updateLocked(bool value) async {
    try {
      await _document.update({'locked': value, 'reseted': false});
      locked = value;
      reseted = false;
      notifyListeners();
    } catch (e) {
      // TODO: 예외처리하기
    }
  }

  Future resetData() async {
    try {
      await _document.update(
        {'locked': true, 'reseted': true, 'trueCount': 0, 'falseCount': 0},
      );
      locked = true;
      reseted = true;
      trueCount = 0;
      falseCount = 0;
      notifyListeners();
    } catch (e) {
      // TODO: 예외처리
    }
  }

  void initialize() async {
    _document.snapshots().listen((event) {
      var tmp = event.data();
      if (tmp == null) {
        _document.set(
          {'locked': true, 'reseted': true, 'trueCount': 0, 'falseCount': 0}
        );
        locked = true;
        reseted = true;
        trueCount = 0;
        falseCount = 0;
        return;
      }
      var data = tmp;
      trueCount = data['trueCount'];
      falseCount = data['falseCount'];
      notifyListeners();
    },
    onError: (e) {
      // TODO: 에외 처리
    });

    _document.get().then((value) {
      final data = value as Map<String, dynamic>;
      locked = data['locked'];
      reseted = data['reseted'];
      trueCount = data['trueCount'];
      falseCount = data['falseCount'];
    });
  }
}
