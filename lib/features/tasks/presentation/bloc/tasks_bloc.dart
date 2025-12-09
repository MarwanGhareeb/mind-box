import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/task_params.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    // Add
    on<AddTasksEvent>((event, emit) {});

    // Delete
    on<DeleteTasksEvent>((event, emit) {});

    // Get
    on<GetTasksEvent>((event, emit) {});
  }
}
