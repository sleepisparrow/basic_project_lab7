import 'package:flutter/material.dart';

class ProfFeedbackProvider with ChangeNotifier {
  List<int> _choices = List.filled(5, 0);
  List<String> _feedback = List.empty(growable: true);

  List<int> get choices => _choices;
  List<String> get feedback => _feedback;

  void addFeedback(String value) {
    _feedback.add(value);
  }

  set choices(List<int> value) {
    _choices = value;
  }
}