import 'package:flutter/material.dart';

import 'quiz_dummy.dart';

class StudentQuizProvider with ChangeNotifier {

  List<Quiz> _quizList = List.empty(growable: true);

  List<Quiz> get quizList => _quizList;

  void addQuestion(Quiz quiz) {
    _quizList.add(quiz);
  }

  set quizList(List<Quiz> value) {
    _quizList = value;
  }
}