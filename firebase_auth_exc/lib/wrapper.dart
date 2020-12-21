
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_exc/login_page.dart';
import 'package:firebase_auth_exc/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user == null) ?  LoginPage() : MainPage(user: user);
  }
}