import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';

abstract interface class NotesRepo {
  Future<Either<Failure, int>> addNote({required Map<String, dynamic> data});
  Future<Either<Failure, int>> updateNote({
    required Map<String, dynamic> data,
    required int id,
  });
  Future<Either<Failure, int>> deleteNote({required int id});
  Future<Either<Failure, List<NoteEntity>>> getNotes();
}
