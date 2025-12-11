part of 'tasks_bloc.dart';

@immutable
sealed class TasksState {}

final class TasksInitialState extends TasksState {}

final class TasksLoadingState extends TasksState {}

final class TasksLoadedState extends TasksState {
  final List<TaskEntity> tasks;

  TasksLoadedState({required this.tasks});

  TasksLoadedState copyWith({required List<TaskEntity>? tasks}) {
    return TasksLoadedState(tasks: tasks ?? this.tasks);
  }
}

final class TasksErrorState extends TasksState {
  final String message;
  TasksErrorState({required this.message});
}
