part of 'counter_bloc.dart';

@immutable
class CounterState {
  int value;
  CounterState(int value) {
    this.value = value;
  }
}
