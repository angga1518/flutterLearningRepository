import 'package:flutter/material.dart';
import 'package:rive_with_flare_exc/switch_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rive x Flare"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: SwitchDay(),
        ),
      ),
    );
  }
}