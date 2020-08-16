import 'package:flutter/material.dart';
import 'package:test_flutter_interview/ui/category.dart';
import 'package:test_flutter_interview/ui/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recommended"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Start a new career"),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: (MediaQuery.of(context).size.height - 70) * 1/11,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Category(),
                  Category(),
                  Category(),
                  Category(),
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height - 30) * 3/4,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Course(),
                  Course(),
                  Course(),
                  Course(),
                  Course(),
                  Course(),
                ],
              ),
            )
          ],
        ),
      );
  }
}
