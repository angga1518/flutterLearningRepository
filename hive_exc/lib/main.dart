import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_exc/model/monster.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MonsterAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hive Exc"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "List of Monsters",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: Hive.openBox("monsters"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Container(
                          height: 200,
                          width: 100,
                          child: Center(
                            child: Text("ada yang error bro"),
                          ),
                          color: Colors.red);
                    } else {
                      var monsterBox = Hive.box("monsters");
                      if (monsterBox.length == 0) {
                        monsterBox.add(Monster("Vampire", 1));
                        monsterBox.add(Monster("Dracula", 1));
                      }
                      return WatchBoxBuilder(
                        box: monsterBox,
                        builder: (context, monsters) {
                          return Container(
                              height: 200,
                              child: ListView.builder(
                                itemCount: monsters.length,
                                itemBuilder: (context, index) {
                                  Monster monster = monsters.getAt(index);

                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    height: 70,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          monster.name +
                                              " [" +
                                              monster.level.toString() +
                                              "] ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                Icons.arrow_upward,
                                                color: Colors.green,
                                              ),
                                              onPressed: () {
                                                monsters.putAt(
                                                    index,
                                                    Monster(monster.name,
                                                        monster.level + 1));
                                              },
                                              tooltip: "tambah level",
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                monsters.add(monster);
                                              },
                                              icon: Icon(
                                                Icons.content_copy,
                                                color: Colors.yellow,
                                              ),
                                              tooltip: "copy",
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                monsters.deleteAt(index);
                                              },
                                              icon: Icon(
                                                Icons.restore_from_trash,
                                                color: Colors.red,
                                              ),
                                              tooltip: "hapus",
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ));
                        },
                      );
                    }
                  }

                  return Container(
                      height: 200,
                      width: 100,
                      child: Center(
                        child: Text("ada yang error bro"),
                      ),
                      color: Colors.red);
                },
              ),
            ],
          )),
    );
  }
}
