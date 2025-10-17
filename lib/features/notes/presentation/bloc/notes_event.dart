part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {}

final class GetNotesEvent extends NotesEvent {
  final String title;
  GetNotesEvent({this.title = ''});
}

final class AddNoteEvent extends NotesEvent {
  final NoteEntity data;
  AddNoteEvent({required this.data});
}

final class UpdateNoteEvent extends NotesEvent {
  final int id;
  final Map<String, dynamic> data;
  UpdateNoteEvent({required this.id, required this.data});
}

final class DeleteNoteEvent extends NotesEvent {
  final int id;
  DeleteNoteEvent({required this.id});
}
