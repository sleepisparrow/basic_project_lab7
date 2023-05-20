import 'package:flutter/material.dart';

class StuQuestionProvider with ChangeNotifier {
  List<String> questionTitle = [];
  List<String> questionContents = [];
  List<int> wrongInput = [];

  void createQuestion(String title, String contents) {
/*    if(title == "" && contents != ""){
      wrongInput.add(0);
      return;
    }else if(title != "" && contents == ""){
      wrongInput.add(1);
      return;
    }else if(title == "" && contents == ""){
      wrongInput.add(2);
      return;
    }else{
      questionTitle.add(title);
      questionContents.add(contents);
    }*/
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
