import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_1/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  blocTest("inisiasi Bloc", build: () => CounterBloc(), expect: [0]);
  blocTest("add state ", build: () => CounterBloc(), act: (bloc) {
    bloc.add(Add(2));
    bloc.add(Add(2));
    bloc.add(Add(-2));
    bloc.add(Substract(0));
    bloc.add(Add(0));
  }, expect: [2,4,2]);

}