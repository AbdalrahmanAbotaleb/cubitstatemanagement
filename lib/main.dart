import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        print('build parent');
        return CounterCubit();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter App')),
      body: Center(
        child: Column(
          children: [
            BlocSelector<CounterCubit, CounterState, int>(
              selector: (state) => state.counterA,
              builder: (BuildContext context, counterA) {
                print("Build state A");
                return Text(
                  'counter A is ${counterA}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            BlocSelector<CounterCubit, CounterState, int>(
              selector: (state) => state.counterB,
              builder: (context, counterB) {
                print("build state B");
                return Text(
                  'counter B is ${counterB}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().incrementA(),
                child: const Icon(Icons.add),
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decrementA(),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().incrementB(),
                child: const Icon(Icons.add),
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decrementB(),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
