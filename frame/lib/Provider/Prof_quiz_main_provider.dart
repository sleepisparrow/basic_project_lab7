import 'package:flutter/material.dart';

import '../dummy_data/quiz_dummy.dart';

class ProfQuizMainProvider with ChangeNotifier {

  List<String> _question = List.empty(growable: true);

  List<String> get question => _question;

  void addQuestion(Quiz quiz) {
    String questionWord = quiz.question!;
    _question.add(questionWord);
  }

  set question(List<String> value) {
    _question = value;
  }
}