import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  double totalValue = 100;
  int value = 0;

  CustomProgressBar({this.totalValue, this.value});

  double ratio() {
    return value / totalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 10,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
        ),
        Material(
            elevation: 3,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 10,
              width: 300 * ratio(),
              decoration: BoxDecoration(
                  color: (ratio() < 0.3)
                      ? Colors.red
                      : (ratio() < 0.6) ? Colors.yellow : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10)),
            )),
      ],
    );
  }
}

class TimeState extends ChangeNotifier {
  int _value = 0;

  int get value => _value;
  set value(int newvalue) {
    _value = newvalue;
    notifyListeners();
  }
}
