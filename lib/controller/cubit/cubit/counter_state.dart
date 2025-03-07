part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  final int count;

  CounterState(this.count);
  @override
  // TODO: implement props
  List<Object?> get props => [count];
}

class CounterInIt extends CounterState {
  CounterInIt() : super(0);
}

class CounterUpgrade extends CounterState {
  CounterUpgrade(super.count);
}
