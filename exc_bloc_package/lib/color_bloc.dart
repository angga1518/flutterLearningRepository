import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum EventColor{
  to_blue,
  to_yellow
}

class ColorBloc extends Bloc<EventColor, Color>{
  Color _color = Colors.blue;
  @override
  // TODO: implement initialState
  Color get initialState => Colors.blue;

  @override
  Stream<Color> mapEventToState(EventColor event) async* {
    _color = (event == EventColor.to_blue) ? Colors.blue : Colors.yellow;
    yield _color;
  }
}