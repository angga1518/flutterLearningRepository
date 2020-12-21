import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_exc/auth_services.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  User user;
  MainPage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth Main"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.uid),
            RaisedButton(onPressed: () async {
              await AuthServices.signOut();
            })
          ],
        ),
      ),
    );
  }
}
