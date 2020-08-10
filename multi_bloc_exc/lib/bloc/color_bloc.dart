import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent{
  toYellow,
  toBlue,
  toRed
}
class ColorBloc extends Bloc<ColorEvent, Color>{
  @override
  // TODO: implement initialState
  Color get initialState => Colors.blue;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async*{
    if(event == ColorEvent.toYellow){
      yield Colors.yellow;
    }
    else if (event == ColorEvent.toBlue){
      yield Colors.blue;
    }
    else{
      yield Colors.red;
    }
  }
}