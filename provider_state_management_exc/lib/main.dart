import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management_exc/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool active = false;
  Color color = Colors.red;
  double height = 100;
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AppColor>(
        create: (context) {
          return AppColor();
        },
        child: Scaffold(
          appBar: AppBar(title: Consumer<AppColor>(
            builder: (context, value, child) {
              return Text("provider exc",
                  style: TextStyle(color: value.getColor()));
            },
          )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<AppColor>(
                  builder: (context, value, child) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: value.height,
                      width: value.width,
                      color: value.getColor(),
                    );
                  },
                ),
                Consumer<AppColor>(
                  builder: (context, appColor, child) {
                    return Switch(
                        value: active,
                        onChanged: (value) {
                          active = !active;
                          appColor.setActiveStatus(active);
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
