import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc({int initialState}) : super(0);

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    int res;
    if(event is Add){
      res = state + event.value;
    }
    else if (event is Substract){
      res = state - event.value;
    }
    else{
      res = state;
    }
    yield res;
  }
}
