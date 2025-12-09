import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/repositories/tasks_repo.dart';

class GetTaskUseCase {
  GetTaskUseCase(this._repo);

  final TasksRepo _repo;

  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await _repo.getTasks();
  }
}
