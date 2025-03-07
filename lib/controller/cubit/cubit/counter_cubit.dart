import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInIt());

  void incerement() {
    emit(CounterUpgrade(5));
  }

  void decrement() {
    emit(CounterUpgrade(state.count - 1));
  }
}
