part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

final class AddTasksEvent extends TasksEvent {
  final TaskParams params;

  AddTasksEvent({required this.params});
}

final class DeleteTasksEvent extends TasksEvent {
  final int id;

  DeleteTasksEvent({required this.id});
}

final class GetTasksEvent extends TasksEvent {}
