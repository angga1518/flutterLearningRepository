import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incrementCounter(){
    if(state is CounterInitial){
      emit(CounterStateFilled(0));
    }
    else{
      emit(CounterStateFilled((state as CounterStateFilled).value + 1));
    }
  }

  void decrementCounter(){
    if(state is CounterInitial){
      emit(CounterStateFilled(0));
    }
    else{
      emit(CounterStateFilled((state as CounterStateFilled).value - 1));
    }
  }
}
