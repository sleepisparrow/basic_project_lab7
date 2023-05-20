import 'package:flutter/material.dart';

class StuQuestionProvider with ChangeNotifier {

  List<String> questionTitle = [];
  List<String> questionContents = [];

  void createQuestion(String title, String contents){
    print("check");
    if(title == null || contents == null){
      return;
    }
    questionTitle.add(title);
    questionContents.add(contents);

    notifyListeners();
  }

}