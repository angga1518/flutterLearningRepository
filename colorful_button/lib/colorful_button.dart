import 'package:flutter/material.dart';
import 'dart:math';

class ColorfulButton extends StatefulWidget {
  Color color1, color2;

  @override
  _ColorfulButtonState createState() =>
      _ColorfulButtonState(this.color1, this.color2);

  ColorfulButton(this.color1, this.color2);
}

class _ColorfulButtonState extends State<ColorfulButton> {
  Color color1, color2;
  bool onpressed = false;

  _ColorfulButtonState(Color color1, Color color2) {
    this.color1 = color1;
    this.color2 = color2;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            onpressed = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            onpressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            onpressed = false;
          });
        },
        child: Material(
          elevation: (onpressed) ? 5 : 15,
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: color1,
                    child: Transform.rotate(
                      angle: -pi / 4,
                      child: Icon(
                        Icons.adb,
                        color: (onpressed) ? Colors.pink : Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                    offset: Offset(-30, 30),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
                Transform.translate(
                    offset: Offset(-30, -30),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
                Transform.translate(
                    offset: Offset(30, 30),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
                Transform.translate(
                    offset: Offset(30, -30),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
