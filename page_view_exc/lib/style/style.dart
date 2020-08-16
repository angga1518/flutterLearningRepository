import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';

class Style extends StatelessWidget {
  Color currentColor = Colors.blue;
  double scale = 0.0;

  Style({this.currentColor, this.scale});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Parent(
        style: ParentStyle()
          ..height(250*scale)  
          ..width(200)
          ..elevation(3)
          ..background.color(currentColor)
          ..margin(all: 10),
      ),
    );
  }
}
