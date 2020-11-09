import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(), child: Main()),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit cb = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Exc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  (state is CounterInitial)
                      ? "-"
                      : (state as CounterStateFilled).value.toString(),
                  style: TextStyle(fontSize: 80),
                );
              },
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      cb.decrementCounter();
                    },
                    child: Icon(Icons.arrow_downward),
                    backgroundColor: Colors.red[500],
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      cb.incrementCounter();
                    },
                    child: Icon(Icons.arrow_upward),
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
