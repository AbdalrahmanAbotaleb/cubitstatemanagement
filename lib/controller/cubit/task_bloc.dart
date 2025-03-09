import 'dart:async';

import 'package:cubitstatemanagement/controller/cubit/task_event.dart';
import 'package:cubitstatemanagement/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);
    // (event, emit) {
    //   final model =
    //       TaskModel(id: Uuid().v4(), title: event.title, isComplete: false);
    //   emit(UpdateTasks([...state.tasksList, model]));
    // },

    on<RemoveTaskEvent>(_removeTask);
    on<ToggleTaskEvent>(_toggleTask);
  }

  // addTask(
  //   String title,
  // ) {
  //   final model = TaskModel(id: Uuid().v4(), title: title, isComplete: false);
  //   emit(UpdateTasks([...state.tasksList, model]));
  // }

  // removeTask(String id) {
  //   final List<TaskModel> newList =
  //       state.tasksList.where((task) => task.id != id).toList();
  //   emit(UpdateTasks(newList));
  // }

  // toggleTask(int id) {
  //   final List<TaskModel> newList = state.tasksList.map((task) {
  //     return task.id == id ? task.copyWith(isComplete: !task.isComplete) : task;
  //   }).toList();
  //   emit(UpdateTasks(newList));
  // }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    (event, emit) {
      final model =
          TaskModel(id: Uuid().v4(), title: event.title, isComplete: false);
      emit(UpdateTasks([...state.tasksList, model]));
    };
  }

  FutureOr<void> _removeTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    (event, emit) {
      final List<TaskModel> newList =
          state.tasksList.where((task) => task.id != event.id).toList();
      emit(UpdateTasks(newList));
    };
  }

  FutureOr<void> _toggleTask(ToggleTaskEvent event, Emitter<TaskState> emit) {
    (event, emit) {
      final List<TaskModel> newList = state.tasksList.map((task) {
        return task.id == event.id
            ? task.copyWith(isComplete: !task.isComplete)
            : task;
      }).toList();
      emit(UpdateTasks(newList));
    };
  }
}
