import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.amber;
  Color colorTarget = Colors.pink;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test Dragable"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // row dragable
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Draggable<Color>(
                  data: color1,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: color1,
                      elevation: 3,
                      shape: StadiumBorder(),
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: Colors.grey,
                      elevation: 3,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: color1.withOpacity(0.7),
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
                Draggable(
                  data: color2,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: color2,
                      elevation: 3,
                      shape: StadiumBorder(),
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: Colors.grey,
                      elevation: 3,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: color2.withOpacity(0.7),
                      shape: StadiumBorder(),
                    ),
                  ),
                )
              ],
            ),
            DragTarget<Color>(
              onWillAccept: (data) => true,
              onAccept: (data) {
                isAccepted = true;
                colorTarget = data;
              },
              builder: (context, candidate, rejected) {
                if (isAccepted) {
                  return SizedBox(
                      height: 150,
                      width: 150,
                      child: Material(
                          color: colorTarget,
                          elevation: 3,
                          shape: StadiumBorder()));
                } else {
                  return SizedBox(
                      height: 150,
                      width: 150,
                      child: Material(
                          color: Colors.black,
                          elevation: 3,
                          shape: StadiumBorder()));
                }
              },
            )
            // field yang dragtarget
          ],
        ),
      ),
    );
  }
}
