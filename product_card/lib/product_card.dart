import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // notifikasi
        Container(
          margin: EdgeInsets.all(20),
          width: 200,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text("atas"), Text("bawah")],
          ),
        )
      ],
    );
  }
}
