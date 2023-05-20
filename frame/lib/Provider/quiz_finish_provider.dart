import 'package:flutter/material.dart';

class QuizFinishProvider extends ChangeNotifier {
  bool _isQuizFinished = false;

  bool get isQuizFinished => _isQuizFinished;

  set isQuizFinished(bool value) {
    _isQuizFinished = value;
    notifyListeners();
  }
}