import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';

abstract class TasksRepo {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, int>> addTasks({required Map<String, dynamic> data});
  Future<Either<Failure, int>> deleteTasks({required int id});
}
