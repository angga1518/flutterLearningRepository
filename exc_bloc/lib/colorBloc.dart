import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_yellow, to_blue }

class ColorBloc {
  Color _color = Colors.blue;

  StreamController<ColorEvent> _eventController = StreamController();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  ColorBloc() {
    // hubungin event sink ke mapevent
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_blue) {
      _color = Colors.blue;
    } else if (colorEvent == ColorEvent.to_yellow) {
      _color = Colors.yellow;
    }
    _stateSink.add(_color);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }

  Color getColor(){
    return _color;
  }
}
