import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/repositories/tasks_repo.dart';

class DeleteTaskUseCase {
  DeleteTaskUseCase(this._repo);

  final TasksRepo _repo;

  Future<Either<Failure, int>> call({required int id}) async {
    return await _repo.deleteTasks(id: id);
  }
}
