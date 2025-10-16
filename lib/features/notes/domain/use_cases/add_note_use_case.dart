import 'package:dartz/dartz.dart';
import 'package:note_todo_app_mind_box/core/errors/failures.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';

class AddNoteUseCase {
  final NotesRepo _notesRepo;

  AddNoteUseCase(this._notesRepo);
  Future<Either<Failure, int>> call(NoteParams params) async {
    return _notesRepo.addNote(data: params.toMap());
  }
}
