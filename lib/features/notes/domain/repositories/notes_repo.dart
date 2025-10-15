import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';

abstract interface class NotesRepo {
  Future<Either<Failure, int>> addNote(
    String table, {
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, int>> updateNote(
    String table, {
    required Map<String, dynamic> data,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<Either<Failure, int>> deleteNote(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  });
  Future<Either<Failure, List<NoteEntity>>> getNotes(String table);
}
