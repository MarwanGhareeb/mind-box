import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';

class NoteParams {
  final int? id;
  final String? title;
  final String? content;
  final DateTime? createdAt;

  NoteParams({this.id, this.title, this.content, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      NotesDBKeys.notesTitle: title,
      NotesDBKeys.notesContent: content,
      NotesDBKeys.notesCreatedAt: createdAt?.toIso8601String(),
    };
  }
}
