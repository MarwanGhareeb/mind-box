part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksLoaded extends TasksState {
  final List<TaskEntity> tasks;

  TasksLoaded({required this.tasks});

  TasksLoaded copyWith({required List<TaskEntity>? tasks}) {
    return TasksLoaded(tasks: tasks ?? this.tasks);
  }
}

final class TasksError extends TasksState {
  final String message;
  TasksError({required this.message});
}
