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
          title: Text("latihan Inkwell"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                    child: Text("raised button ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    textColor: Colors.white,
                    onPressed: () {},
                    shape: StadiumBorder(),
                    color: Colors.amber)),
            Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red, Colors.yellow], begin: Alignment.bottomLeft, end: Alignment.topRight), borderRadius: BorderRadius.circular(90)),
              width: 200,
              height: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(90),
                  splashColor: Colors.blue,
                  child: Center(child: Text("inkwell button", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))),
                  onTap: () {},
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
