import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:page_view_exc/style/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Color> listColor = [Colors.blue, Colors.yellow, Colors.red];
  PageController pc = PageController(initialPage: 0, viewportFraction: 0.6);
  double currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc.addListener(() {
      setState(() {
        currentPage = pc.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View Exc"),
      ),
      body: PageView.builder(
        controller: pc,
        itemBuilder: (context, index) {
          double diff = ((index - currentPage)<0) ? (index - currentPage)*-1  : (index - currentPage);
          diff = min(diff, 1);
          return Style(currentColor: listColor[index], scale: 1-(diff*0.3));
        },
        itemCount: 3,
      ),
    );
  }
}
