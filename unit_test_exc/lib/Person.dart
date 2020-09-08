import 'dart:math';

import 'package:equatable/equatable.dart';

class Person extends Equatable {
  List<dynamic> favNum = [];
  String name;
  int _age = 20;
  int _height;

  Person(this.name, this.favNum, this._height);

  int get getHeight => max(_height, 0);
  set setHeight(int height) => this._height = max(height, 0);

  int getAge() {
    return this._age;
  }

  void setAge(int _age) {
    this._age = max(_age, 1);
  }

  void addFavNum(int favNum) {
    this.favNum.add(max(favNum, 0));
  }

  Future<bool> getFuture() async{
    return true;
  }

// kalo favnum dia auto cek ke dalam lagi ga?
// atau pasti beda karena bandingin list dengan list

  @override
  List<Object> get props => [name, favNum, _height];

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(json['name'], json['favNum'], json['height']);
  }
}
