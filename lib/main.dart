import 'package:cubitstatemanagement/controller/cubit/task_bloc.dart';
import 'package:cubitstatemanagement/controller/cubit/task_event.dart';
import 'package:cubitstatemanagement/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController controller = TextEditingController();

  // void _incrementCounter() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => TaskBloc(),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Enter Task'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (controller.text.isEmpty) return;
                      context
                          .read<TaskBloc>()
                          .add(AddTaskEvent(controller.text));
                      controller.clear();
                    },
                    child: Text("Add Task")),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(state.tasksList[index].title),
                        leading: IconButton(
                            onPressed: () {
                              context.read<TaskBloc>().add(
                                  RemoveTaskEvent(state.tasksList[index].id));
                            },
                            icon: Icon(Icons.delete)));
                  },
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
