import 'package:flutter/material.dart';
import 'package:product_card/product_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("latihan product card"),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ProductCard();
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
