import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class GetNotesUseCase {
  final NotesRepo _notesRepo;

  GetNotesUseCase(this._notesRepo);

  Future<Either<Failure, List<NoteEntity>>> call({String? title}) async {
    return await _notesRepo.getNotes();
  }
}
