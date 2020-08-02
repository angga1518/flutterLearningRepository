import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'progress_bar.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatefulWidget {  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStop = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("progress bar exc"),
        ),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (context) {
              return TimeState();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<TimeState>(builder: (context, ts, child) {
                  return CustomProgressBar(totalValue: 15, value: ts.value);
                }),
                Consumer<TimeState>(builder: (context, ts, child) {
                  return RaisedButton(
                    onPressed: () {
                      isStop = false;
                      Timer.periodic(Duration(milliseconds: 500), (timer) {
                        if (ts.value >= 15 || isStop) {
                          timer.cancel();
                        } else {
                          ts.value += 1;
                        }
                      });
                    },
                    child: Text("start"),
                  );
                }),
                Consumer<TimeState>(builder: (context, ts, child) {
                  return RaisedButton(
                    onPressed: () {
                      ts.value = 0;
                      isStop = true;
                    },
                    child: Text("restart from 0"),
                  );
                }),
                Consumer<TimeState>(builder: (context, ts, child) {
                  return RaisedButton(
                    onPressed: () {
                      isStop = true;
                    },
                    child: Text("stop"),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
