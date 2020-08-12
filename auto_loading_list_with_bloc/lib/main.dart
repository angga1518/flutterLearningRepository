import 'package:auto_loading_list_with_bloc/bloc/post_bloc.dart';
import 'package:auto_loading_list_with_bloc/ui/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostBloc>(
        builder: (context) {
          return PostBloc() .. add(PostEvent());
        },
        child: MainPage()),
    );
  }
}