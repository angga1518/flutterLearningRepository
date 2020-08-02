import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  Color color1 = Colors.amber[100];
  Color color2 = Colors.orange;
  Color back = Colors.deepOrangeAccent[100];

  double smallDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 2 / 3;
  }

  double bigDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 7 / 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -smallDiameter(context) / 3,
            top: -smallDiameter(context) / 3,
            child: Container(
              width: smallDiameter(context),
              height: smallDiameter(context),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(smallDiameter(context) / 2),
                  gradient: LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -bigDiameter(context) / 5,
            top: -bigDiameter(context) / 4,
            child: Container(
              width: bigDiameter(context),
              height: bigDiameter(context),
              child: Column(children: <Widget>[
                Spacer(flex: 5),
                Text("Dribble",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Spacer(flex: 3),
              ]),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(bigDiameter(context) / 2),
                  gradient: LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: color2)),
                                hintText: "Masukin email bro..",
                                icon: Icon(
                                  Icons.email,
                                  color: color2,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: color2))),
                        TextField(
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: color2)),
                                hintText: "Masukin pass bro..",
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: color2,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: color2)))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 35),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                      child: Text("Forgot Password? ",
                          style: TextStyle(fontSize: 15, color: color2)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              splashColor: Colors.blue,
                              child: Center(
                                child: Text("Sign In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [color1, color2],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      ),
                      Spacer(flex: 1),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: false,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://png.pngtree.com/element_our/md/20180518/md_5aff6081b74c8.jpg')),
                        ),
                      ),
                      Spacer(flex: 1),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: false,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'data:image/jpeg;base64,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')),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Don't have an account? ",
                            style: TextStyle(color: color1, fontSize: 20)),
                        Text("Sign Up Bro..",
                            style: TextStyle(color: color2, fontSize: 20))
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
