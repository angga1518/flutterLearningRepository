import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 3,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Center(
          child: Text("Data Scientist",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.red[100]),
    );
  }
}
