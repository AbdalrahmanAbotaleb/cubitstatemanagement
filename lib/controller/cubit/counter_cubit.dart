import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterUpdated(state.counter + 1));
  }

  void decrement() {
    emit(CounterUpdated(state.counter - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterUpdated(json['count']);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return {'count': state.counter};
  }
}
