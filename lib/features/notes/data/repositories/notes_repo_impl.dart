import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';
import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/data/models/note_model.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final DatabaseConsumer _databaseConsumer;

  NotesRepoImpl(this._databaseConsumer);

  @override
  Future<Either<Failure, int>> addNote({
    required Map<String, dynamic> data,
  }) async {
    try {
      return Right(
        await _databaseConsumer.addData(NotesDBKeys.notesTable, data: data),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from add note:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> deleteNote({required int id}) async {
    try {
      return Right(
        await _databaseConsumer.deleteData(NotesDBKeys.notesTable, id: id),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from delete note:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes({String? title}) async {
    try {
      final List<Map<String, dynamic>> data = await _databaseConsumer.getData(
        NotesDBKeys.notesTable,
        title: title,
      );
      return Right(
        data.map((note) => NoteModel.fromJson(note).toEntity()).toList(),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from get note:\n  ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, int>> updateNote({
    required Map<String, dynamic> data,
    required int id,
  }) async {
    try {
      return Right(
        await _databaseConsumer.updateData(
          NotesDBKeys.notesTable,
          data: data,
          id: id,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(
        Failure("UnExcepected Error from update note:\n  ${e.toString()}"),
      );
    }
  }
}
