import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterA: 0, counterB: 0));

  void incrementA() {
    emit(state.copyWith(counterA: state.counterA + 1));
  }

  void decrementA() {
    emit(state.copyWith(counterA: state.counterA - 1));
  }

  void incrementB() {
    emit(state.copyWith(counterB: state.counterB + 1));
  }

  void decrementB() {
    emit(state.copyWith(counterB: state.counterB - 1));
  }
}
