import 'package:flutter/material.dart';
import 'package:navigasi_multi_page/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("login"),
            RaisedButton(
                child: Text("login"),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                })
          ],
        ));
  }
}
