import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class DeleteNoteUseCase {
  final NotesRepo _notesRepo;

  DeleteNoteUseCase(this._notesRepo);

  Future<Either<Failure, int>> call(NoteParams params) async {
    return await _notesRepo.deleteNote(id: params.id);
  }
}
