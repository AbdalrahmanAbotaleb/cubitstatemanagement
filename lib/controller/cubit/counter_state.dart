part of 'counter_cubit.dart';

sealed class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterUpdated extends CounterState {
  CounterUpdated(int counter) : super(counter);
}
