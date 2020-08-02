import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          builder: (context) {
            return ColorBloc();
          },
          child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc without library"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (BuildContext context, Color state) {
            return AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 100,
                width: 100,
                color: state);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              colorBloc.dispatch(EventColor.to_blue);
            },
            child: Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              colorBloc.dispatch(EventColor.to_yellow);
            },
            child: Icon(
              Icons.color_lens,
              color: Colors.white,
            ),
            backgroundColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}
