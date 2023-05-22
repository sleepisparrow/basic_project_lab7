import 'package:flutter/material.dart';

class StuQuestionProvider with ChangeNotifier {
  List<String> questionTitle = [];
  List<String> questionContents = [];
  List<int> wrongInput = [];

  void createQuestion(String title, String contents) {
    if (title == "" || contents == "") {
      return;
    }
    questionTitle.add(title);
    questionContents.add(contents);
    notifyListeners();
  }

  void initWrongInput() {
    wrongInput.clear();
  }
}
