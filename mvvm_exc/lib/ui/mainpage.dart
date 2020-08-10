import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:mvvm_exc/bloc/user_bloc.dart';
import 'package:mvvm_exc/model/user.dart';
import 'package:mvvm_exc/ui/user_card.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM Exc"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              bloc.dispatch(random.nextInt(10));
            },
            child: Text("generate random num"),
            color: Colors.yellow,
          ),
          Container(
            height: 200,
            child: BlocBuilder<UserBloc, List<User>>(
              builder: (context, user) {
                return (user == [])
                    ? Container(
                        child: Text("awal"),
                        alignment: Alignment.center,
                      )
                    : ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (context, index) {
                          return UserCard(user[index]);
                        });
              },
            ),
          ),
        ],
      ),
    );
  }
}
