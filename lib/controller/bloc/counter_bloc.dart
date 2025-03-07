import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInIt()) {
    on<IncrementEvent>(_increment);
    // on<IncrementEvent>((event, emit) {
    //   // emit(CounterUpgrade(state.count + 1)); // تحديث الحالة بشكل صحيح
    // });

    on<DecrementEvent>((event, emit) {
      emit(CounterUpgrade(state.count - 1)); // تحديث الحالة بشكل صحيح
    });
  }

  FutureOr<void> _increment(IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterUpgrade(state.count + 1)); // تحديث الحالة بشكل صحيح
  }
}
