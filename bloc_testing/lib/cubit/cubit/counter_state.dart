part of 'counter_cubit.dart';

// Using Equatable to make tests passed
class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;

  const CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}

// Without using Equatable tests should be error
// class CounterState {
//   int counterValue;
//   bool? wasIncremented;

//   CounterState({
//     required this.counterValue,
//     this.wasIncremented,
//   });
// }
