import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = "initial data";
  TextEditingController controller = TextEditingController();
  bool active = false;

  void save() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // coba kalo data, tapi datanya diubah, sama ga
    sp.setString("data", controller.text);
    sp.setBool("active", active);
  }

  void load() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    data = sp.getString("data");
    active = sp.getBool("active");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("shared preferences"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  data,
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                Switch(
                  value: active,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      active = value;
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() {
                      data = controller.text;
                      save();
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Load"),
                  onPressed: () {
                    setState(() {
                      load();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
