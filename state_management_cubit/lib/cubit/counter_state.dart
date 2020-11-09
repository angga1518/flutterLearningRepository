part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterStateFilled extends CounterState {
  int value = 0;
  CounterStateFilled(int value) {
    this.value = value;
  }
}
