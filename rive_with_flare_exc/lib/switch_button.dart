import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SwitchDay extends StatefulWidget {
  @override
  _SwitchDayState createState() => _SwitchDayState();
}

class _SwitchDayState extends State<SwitchDay> {
  // 0 -> day
  // 1 -> otw night
  // 2 -> night
  // 3 -> otw day
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (currentState == 0) {
              currentState = 1;
            } else if (currentState == 2) {
              currentState = 3;
            }
          });
        },
        child: SizedBox(
            width: 200,
            child: FlareActor(
              "assets/switch_daytime.flr",
              animation: (currentState == 0)
                  ? "day_idle"
                  : (currentState == 1)
                      ? "switch_night"
                      : (currentState == 2) ? "night_idle" : "switch_day",
              callback: (name) {
                if (currentState == 1) {
                  currentState = 2;
                } else if (currentState == 3) {
                  currentState = 0;
                }
              },
            )));
  }
}
