import 'package:flutter/material.dart';

class ProClassRoomList with ChangeNotifier {
  late Text dropDownSelectedClassName;
  List<String> createDate = [];
  int itemCount = 0;


  void createContentsResource(
      Text dropDownSelectedClassName,
      String createDate)
  {
    itemCount++;
    this.dropDownSelectedClassName = dropDownSelectedClassName;
    this.createDate.add(createDate);
    notifyListeners();
  }
}
