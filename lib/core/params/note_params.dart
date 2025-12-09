import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';

class NoteParams {
  final int? id;
  final String title;
  final String content;
  final int color;

  NoteParams({
    this.id,
    required this.title,
    required this.content,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      NotesDBKeys.noteId: id,
      NotesDBKeys.noteTitle: title,
      NotesDBKeys.noteContent: content,
      NotesDBKeys.noteColor: color,
    };
  }
}
