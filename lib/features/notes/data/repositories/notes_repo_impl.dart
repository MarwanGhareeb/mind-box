import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/data/data_sources/notes_local_data_source.dart';
import 'package:note_todo_app_mind_box/features/notes/data/models/note_model.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final NotesLocalDataSource _notesLocalDataSource;

  NotesRepoImpl(this._notesLocalDataSource);

  @override
  Future<Either<Failure, int>> addNote({
    required Map<String, dynamic> data,
  }) async {
    try {
      return Right(
        await _notesLocalDataSource.add(NotesDBKeys.notesTable, data: data),
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
        await _notesLocalDataSource.delete(NotesDBKeys.notesTable, id: id),
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
  Future<Either<Failure, List<NoteEntity>>> getNotes() async {
    try {
      final List<Map<String, dynamic>> data =
          await _notesLocalDataSource.get(NotesDBKeys.notesTable);
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
        await _notesLocalDataSource.update(
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
