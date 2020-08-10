import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_exc/bloc/color_bloc.dart';
import 'package:multi_bloc_exc/bloc/counter_bloc.dart';
import 'package:multi_bloc_exc/ui/secondPage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc cb = BlocProvider.of<CounterBloc>(context);
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Second Page"),
            backgroundColor: color,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<CounterBloc, int>(
                  builder: (context, counter) {
                    return GestureDetector(
                      onTap: () {
                        cb.dispatch(counter + 1);
                      },
                      child: Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        colorBloc.dispatch(ColorEvent.toBlue);
                      },
                      color: Colors.blue,
                      shape: CircleBorder(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        colorBloc.dispatch(ColorEvent.toRed);
                      },
                      color: Colors.red,
                      shape: CircleBorder(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        colorBloc.dispatch(ColorEvent.toYellow);
                      },
                      color: Colors.yellow,
                      shape: CircleBorder(),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
