import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_consumer.dart';
import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/data/models/note_model.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class NotesRepoImpl implements NotesRepo {
  final SqfliteConsumer _sqfliteConsumer;

  NotesRepoImpl(this._sqfliteConsumer);

  @override
  Future<Either<Failure, int>> addNote({
    required Map<String, dynamic> data,
  }) async {
    try {
      return Right(
        await _sqfliteConsumer.addData(NotesDBKeys.notesTable, data: data),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from add note"));
    }
  }

  @override
  Future<Either<Failure, int>> deleteNote({required int id}) async {
    try {
      return Right(
        await _sqfliteConsumer.deleteData(NotesDBKeys.notesTable, id: id),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from delete note"));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes() async {
    try {
      final List<Map<String, dynamic>> data = await _sqfliteConsumer.getData(
        NotesDBKeys.notesTable,
      );
      return Right(
        (data.map((e) => NoteModel.fromJson(e).toEntity()).toList(),)
            as List<NoteEntity>,
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from get note"));
    }
  }

  @override
  Future<Either<Failure, int>> updateNote({
    required Map<String, dynamic> data,
    required int id,
  }) async {
    try {
      return Right(
        await _sqfliteConsumer.updateData(
          NotesDBKeys.notesTable,
          data: data,
          id: id,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from update note"));
    }
  }
}
