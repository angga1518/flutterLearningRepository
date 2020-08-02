import 'package:colorful_button/colorful_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Colorful Button"),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              ColorfulButton(Colors.yellow, Colors.blue),
              ColorfulButton(Colors.blueGrey, Colors.blue),
              ColorfulButton(Colors.redAccent, Colors.blue),
              ColorfulButton(Colors.lightGreen, Colors.blue),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }
}
