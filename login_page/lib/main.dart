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
                                'https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/SpongeBob_SquarePants_character.svg/1200px-SpongeBob_SquarePants_character.svg.png'),
                          ),
                        ),
                      ),
                      Spacer(flex: 1)
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
