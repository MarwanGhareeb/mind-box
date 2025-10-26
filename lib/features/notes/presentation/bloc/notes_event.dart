part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {}

final class GetNotesEvent extends NotesEvent {
  final String title;
  GetNotesEvent({this.title = ''});
}

final class AddNoteEvent extends NotesEvent {
  final NoteParams params;
  AddNoteEvent({required this.params});
}

final class UpdateNoteEvent extends NotesEvent {
  final NoteParams params;
  UpdateNoteEvent({required this.params});
}

final class DeleteNoteEvent extends NotesEvent {
  final int id;
  DeleteNoteEvent({required this.id});
}
