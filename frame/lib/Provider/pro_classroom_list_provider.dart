import 'package:flutter/material.dart';

class ProClassRoomListProvider with ChangeNotifier {

  Map<Text, int> dropItemCountMap = {};
  Map<Text, List<String>> dropCreateDateMap = {};
  Text toggleSelectedItem = Text("BeforeSelecting");
  String selectedDate = "BeforeSelecting";

  void increaseItemCount(Text dropSelectedItem, String dropCreateDate){
    if(dropItemCountMap.containsKey(dropSelectedItem)){
      dropItemCountMap[dropSelectedItem] = dropItemCountMap[dropSelectedItem]!+1;
      dropCreateDateMap[dropSelectedItem]!.add(dropCreateDate);
    }
    else{
      List<String> list = [dropCreateDate];
      dropItemCountMap[dropSelectedItem] = 1;
      dropCreateDateMap[dropSelectedItem] = list;
    }
  }

  void setToggleSelectedItem(Text selectedItem){
    this.toggleSelectedItem = selectedItem;
    notifyListeners();
  }

}
