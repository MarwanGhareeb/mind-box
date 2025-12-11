import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/tasks/data/data_source/tasks_local_data_source.dart';
import 'package:note_todo_app_mind_box/features/tasks/data/models/task_model.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/repositories/tasks_repo.dart';

class TasksRepoImpl extends TasksRepo {
  TasksRepoImpl(this._tasksLocalDataSource);

  final TasksLocalDataSource _tasksLocalDataSource;

  List<TaskEntity>? _cachedTasks;

  @override
  Future<Either<Failure, int>> addTasks({
    required Map<String, dynamic> data,
  }) async {
    try {
      return Right(
        await _tasksLocalDataSource.add(
          TasksDBKeys.tasksTable,
          data: data,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from add task:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> deleteTasks({required int id}) async {
    try {
      return Right(
        await _tasksLocalDataSource.delete(
          TasksDBKeys.tasksTable,
          id: id,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from delete task:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    if (_cachedTasks != null) return Right(_cachedTasks!);

    try {
      final List<Map<String, dynamic>> data =
          await _tasksLocalDataSource.get(TasksDBKeys.tasksTable);

      _cachedTasks = data
          .map(
            (task) => TaskModel.fromJson(task).toEntity(),
          )
          .toList();
      return Right(_cachedTasks!);
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from get tasks:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> updateTasks(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      return Right(
        await _tasksLocalDataSource.update(
          TasksDBKeys.tasksTable,
          data: data,
          id: id,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from update tasks:\n  ${e.toString()}"),
      );
    }
  }
}
