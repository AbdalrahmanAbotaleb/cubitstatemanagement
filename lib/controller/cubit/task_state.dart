part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> tasksList;

  const TaskState(this.tasksList);

  @override
  List<Object> get props => [tasksList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class UpdateTasks extends TaskState {
  const UpdateTasks(super.tasksList);
}
