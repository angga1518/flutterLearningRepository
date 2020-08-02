import 'package:flutter/material.dart';
import 'package:navigasi_multi_page/secondpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Homepage"),
            RaisedButton(
                child: Text("secondpage"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SecondPage();
                    },
                  ));
                })
          ],
        ));
  }
}
