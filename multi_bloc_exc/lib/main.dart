import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_exc/bloc/color_bloc.dart';
import 'package:multi_bloc_exc/bloc/counter_bloc.dart';
import 'package:multi_bloc_exc/ui/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          builder: (context) {
            return ColorBloc();
          },
        ),
        BlocProvider<CounterBloc>(
          builder: (context) {
            return CounterBloc();
          },
        ),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
