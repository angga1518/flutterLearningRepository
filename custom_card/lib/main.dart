import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Main());
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("latihan custom card"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black38, Colors.amber],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                elevation: 3,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2018/01/20/08/33/sunset-3094078_960_720.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                10,
                                10 + MediaQuery.of(context).size.height * 0.05,
                                10,
                                10 + MediaQuery.of(context).size.height * 0.05),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Beautiful Sunset at Paddy Field",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: <Widget>[
                                    Spacer(flex: 10),
                                    Icon(Icons.thumb_up, color: Colors.blue),
                                    Spacer(flex: 1),
                                    Text("99"),
                                    Spacer(flex: 5),
                                    Icon(Icons.comment, color: Colors.blue),
                                    Spacer(flex: 1),
                                    Text("200"),
                                    Spacer(flex: 10),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
