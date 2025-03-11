part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);

  @override
  List<Object?> get props => [];
}

class CounterUpdated extends CounterState {
  CounterUpdated(int counter) : super(counter);

  @override
  List<Object?> get props => [counter];
}
