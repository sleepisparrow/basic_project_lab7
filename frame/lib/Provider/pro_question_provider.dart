import 'package:flutter/cupertino.dart';

class ProQuestionProvider extends ChangeNotifier {
  List<QuestionData> questions = List.empty(growable: true);

  void setAnswered(int index) {
    questions[index].answered = true;
    notifyListeners();
  }
}

class QuestionData {
  final String title, content;
  bool answered = false;

  QuestionData({required this.title, required this.content});
}
