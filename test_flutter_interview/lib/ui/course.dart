import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 3,
      height: (MediaQuery.of(context).size.height - 30) / 5,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height - 30) / 5 - 20,
            width: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.yellow[100]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Data Science"),
                  Text("17 courses"),
                ],
              ),
              Text(
                  "letters, as oppose",textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,)
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.red[100]),
    );
  }
}
