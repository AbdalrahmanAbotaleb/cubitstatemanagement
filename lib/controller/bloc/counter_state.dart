part of 'counter_bloc.dart';

sealed class CounterState {
  final int count;

  CounterState(this.count);
}

class CounterInIt extends CounterState {
  CounterInIt() : super(0);
}

class CounterUpgrade extends CounterState {
  CounterUpgrade(super.count);
}
