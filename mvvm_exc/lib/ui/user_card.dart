import 'package:flutter/material.dart';
import 'package:mvvm_exc/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.red[100]),
      child: Column(
        children: <Widget>[
          Text("email: " + user.email),
          Text("id: " + user.id),
          Text("name: " + user.name),
        ],
      ),
    );
  }
}
