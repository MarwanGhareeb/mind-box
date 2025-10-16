import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class GetNoteUseCase {
  final NotesRepo _notesRepo;

  GetNoteUseCase(this._notesRepo);

  Future<Either<Failure, List<NoteEntity>>> call([NoteParams? params]) async {
    final allNotes = await _notesRepo.getNotes();

    return allNotes.fold((l) => Left(l), (notes) {
      if (params == null || params.title.isEmpty) return Right(notes);

      return Right(
        (notes.where(
          (note) =>
              note.title.toLowerCase().contains(params.title.toLowerCase()),
        )).toList(),
      );
    });
  }
}
