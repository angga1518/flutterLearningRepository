import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor with ChangeNotifier {
  Color color = Colors.red;
  bool active = false;
  double height = 100;
  double width = 100;

  void setActiveStatus(bool active) {
    this.active = active;
    if(active){
      color = Colors.yellow;
      height = 50;
      width = 50; 
    }
    else{
      color = Colors.red;
      height = 100;
      width = 100; 
    }
    notifyListeners();
  }

  Color getColor(){
    if(active){
      return color;
    }
    else{
      return Colors.red;
    }
  }
}
