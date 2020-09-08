import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          margin: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
                buildCard()
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard() {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.account_box, color: Colors.blueGrey),
            margin: EdgeInsets.all(5),
          ),
          Text("Account Box")
        ],
      ),
    );
  }
}
