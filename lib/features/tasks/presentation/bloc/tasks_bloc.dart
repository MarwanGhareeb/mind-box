import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/task_params.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/get_task_use_case.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/update_task_use_case.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetTaskUseCase _getTaskUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  final bool _isLoadedOnce = false;

  TasksBloc(
    this._getTaskUseCase,
    this._addTaskUseCase,
    this._updateTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(TasksInitialState()) {
    // Get
    on<GetTasksEvent>(
      (event, emit) async {
        if (!_isLoadedOnce) emit(TasksLoadingState());

        final results = await _getTaskUseCase.call();

        results.fold(
          (falure) => emit(TasksErrorState(message: falure.message)),
          (tasks) => emit(TasksLoadedState(tasks: tasks)),
        );
      },
    );

    // Add
    on<AddTasksEvent>(
      (event, emit) async {
        if (state is TasksLoadedState) {
          final currentState = state as TasksLoadedState;

          final result = await _addTaskUseCase.call(params: event.params);

          result.fold(
            (falure) => emit(TasksErrorState(message: falure.message)),
            (taskId) {
              final newTask = TaskEntity(
                id: taskId,
                title: event.params.title,
                isCompleted: event.params.isCompleted,
              );

              emit(
                currentState.copyWith(tasks: [...currentState.tasks, newTask]),
              );
            },
          );
        }
      },
    );

    // Update
    on<UpdateTasksEvent>(
      (event, emit) async {
        if (state is TasksLoadedState) {
          final currentState = state as TasksLoadedState;

          final result = await _updateTaskUseCase.call(params: event.params);

          result.fold(
            (falure) => emit(TasksErrorState(message: falure.message)),
            (_) {
              final updatedList = currentState.tasks
                  .map(
                    (task) => task.id == event.params.id
                        ? TaskEntity(
                            id: event.params.id!,
                            title: event.params.title,
                            isCompleted: event.params.isCompleted,
                          )
                        : task,
                  )
                  .toList();

              emit(
                currentState.copyWith(tasks: updatedList),
              );
            },
          );
        }
      },
    );

    // Delete
    on<DeleteTasksEvent>(
      (event, emit) async {
        if (state is TasksLoadedState) {
          final currentState = state as TasksLoadedState;

          final result = await _deleteTaskUseCase.call(id: event.id);

          result.fold(
            (falure) => emit(TasksErrorState(message: falure.message)),
            (_) {
              final updateList = currentState.tasks
                  .where((task) => task.id != event.id)
                  .toList();
              emit(currentState.copyWith(tasks: updateList));
            },
          );
        }
      },
    );
  }
}
