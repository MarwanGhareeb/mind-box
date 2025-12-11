import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/core/params/task_params.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/repositories/tasks_repo.dart';

class UpdateTaskUseCase {
  UpdateTaskUseCase(this._repo);

  final TasksRepo _repo;

  Future<Either<Failure, int>> call({required TaskParams params}) async {
    return await _repo.updateTasks(data: params.toMap(), id: params.id!);
  }
}
