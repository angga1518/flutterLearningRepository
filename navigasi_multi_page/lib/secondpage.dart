import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("SecondPage"),
          RaisedButton(child: Text("back"),onPressed: () {Navigator.pop(context);})
        ],
      ) 
    );
  }
}