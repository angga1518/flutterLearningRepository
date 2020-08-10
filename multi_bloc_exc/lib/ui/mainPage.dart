import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_exc/bloc/color_bloc.dart';
import 'package:multi_bloc_exc/bloc/counter_bloc.dart';
import 'package:multi_bloc_exc/ui/secondPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc cb = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Main Page"),
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
                        cb.dispatch(counter+1);
                      },
                      child: Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        },
                      ));
                    },
                    child: Text("change color"),
                    color: color,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
