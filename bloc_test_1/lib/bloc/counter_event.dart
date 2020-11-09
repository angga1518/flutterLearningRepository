part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  final int value;
  CounterEvent(this.value);
}

class Add extends CounterEvent{
  Add(int amount) : super(amount);
}
class Substract extends CounterEvent{
  Substract(int amount) : super(amount);
}
class Nothing extends CounterEvent{
  Nothing() : super(null);
}