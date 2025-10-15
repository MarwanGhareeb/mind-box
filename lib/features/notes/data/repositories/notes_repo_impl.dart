import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, int>> addNote(
    String table, {
    required Map<String, dynamic> data,
  }) async {
    try {
      return Right(await _sqfliteConsumer.addData(table, data: data));
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from add note"));
    }
  }

  @override
  Future<Either<Failure, int>> deleteNote(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      return Right(
        await _sqfliteConsumer.deleteData(
          table,
          where: where,
          whereArgs: whereArgs,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from delete note"));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes(String table) async {
    try {
      final List<Map<String, dynamic>> data = await _sqfliteConsumer.getData(
        table,
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
  Future<Either<Failure, int>> updateNote(
    String table, {
    required Map<String, dynamic> data,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      return Right(
        await _sqfliteConsumer.updateData(
          table,
          data: data,
          where: where,
          whereArgs: whereArgs,
        ),
      );
    } on LocalDatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(Failure("UnExcepected Error from update note"));
    }
  }
}
