// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState {
  final int counterA;
  final int counterB;
  const CounterState({required this.counterA, required this.counterB});

  CounterState copyWith({
    int? counterA,
    int? counterB,
  }) {
    return CounterState(
      counterA: counterA ?? this.counterA,
      counterB: counterB ?? this.counterB,
    );
  }
}
