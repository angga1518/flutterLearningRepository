import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Latihan Tab View"),
              bottom: TabBar(
                indicator: BoxDecoration(
                    color: Colors.yellow,
                    border: Border(
                        bottom: BorderSide(color: Colors.amber, width: 5))),
                indicatorColor: Colors.red,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.access_alarm), text: "tab 1"),
                  Tab(icon: Icon(Icons.access_alarm), text: "tab 2"),
                  Tab(icon: Icon(Icons.access_alarm), text: "tab 3"),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: Text("tab 1"),
                ),
                Center(
                  child: QrImage(
                    data:
                        "https://www.youtube.com/watch?v=7CFAEXymRvM&list=PLZQbl9Jhl-VACm40h5t6QMDB92WlopQmV&index=30",
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Center(
                  child: Text("tab 3"),
                )
              ],
            ),
          )),
    );
  }
}
