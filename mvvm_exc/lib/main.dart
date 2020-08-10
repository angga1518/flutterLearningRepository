import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_exc/bloc/user_bloc.dart';
import 'package:mvvm_exc/ui/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        builder: (context) {
          return UserBloc();
        },
        child: MainPage(),
      ),
    );
  }
}
