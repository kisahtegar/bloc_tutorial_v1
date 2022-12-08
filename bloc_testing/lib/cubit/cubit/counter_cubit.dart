import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() {
    emit(CounterState(
        counterValue: state.counterValue - 1, wasIncremented: false));

    // statement to handle value cant be negative
    // if (state.counterValue <= 0) {
    //   state.counterValue = 0;
    // } else {
    //   emit(CounterState(
    //       counterValue: state.counterValue - 1, wasIncremented: false));
    // }
  }
}
