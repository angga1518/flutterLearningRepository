import 'package:firebase_cloud_store_exc/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth Login"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("sign in anonim"),
          onPressed: () {
            AuthServices.signInAnonymous();
          },
        ),
      ),
    );
  }
}
