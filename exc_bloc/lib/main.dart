import 'package:exc_bloc/colorBloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    colorBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("bloc without library"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: colorBloc.stateStream,
          initialData: Colors.blue,
          builder: (context, snapshot) {
            return AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 100,
                width: 100,
                color: snapshot.data);
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_blue);
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
                colorBloc.eventSink.add(ColorEvent.to_yellow);
              },
              child: Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
              backgroundColor: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
