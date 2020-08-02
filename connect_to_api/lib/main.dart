import 'package:connect_to_api/get_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<GetAPI> getApi = [];
  String page = "";
  TextEditingController controller1 = TextEditingController();
  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "learn how to connect to API",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("tes"),
                TextField(
                    controller: controller1,
                    decoration: InputDecoration(hintText: "page"),
                    onSubmitted: (value) {
                      page = value;
                      GetAPI.getData(page).then((value) {
                        getApi = value;
                        int count = 0;
                        for (var x in getApi) {
                          count++;
                          listWidget.add(Text(x.toString(),
                              style: TextStyle(fontSize: 20)));
                          if (count > 5) {
                            break;
                          }
                        }
                        setState(() {});
                      });
                    }),
                // Expanded(
                //     child: SizedBox(
                //         height: 200,
                //         child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (context, index) {
                //             return new Row(
                //               children: listWidget,
                //             );
                //           },
                //         )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
