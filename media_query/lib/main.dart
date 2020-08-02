import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double lebar;
    double panjang;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      panjang = MediaQuery.of(context).size.height / 2;
      lebar = MediaQuery.of(context).size.width / 4;
    } else {
      panjang = MediaQuery.of(context).size.height / 1;
      lebar = MediaQuery.of(context).size.width / 5;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("latihan mediaQuery"),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          width: lebar,
          height: panjang,
        ),
      ),
    );
  }
}
