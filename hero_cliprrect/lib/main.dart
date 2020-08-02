import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("latihan hero dan cliprrect")),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            }));
          },
          child: Hero(
            tag: 'pp',
            child: Image(
                image: NetworkImage(
                    'https://img.okezone.com/content/2020/07/19/45/2248660/arsenal-kalahkan-man-city-dan-liverpool-dalam-sepekan-arteta-sangat-membanggakan-T3cPtDdsq8.jpg')),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(title: Text("Second Page")),
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
              tag: 'pp',
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                      image: NetworkImage(
                          'https://img.okezone.com/content/2020/07/19/45/2248660/arsenal-kalahkan-man-city-dan-liverpool-dalam-sepekan-arteta-sangat-membanggakan-T3cPtDdsq8.jpg')),
                ),
              ),
            ),
          ),
        ));
  }
}
