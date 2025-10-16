import 'package:note_todo_app_mind_box/core/databases/local/database_keys.dart';

class NoteParams {
  final int id;
  final String title;
  final String? content;
  final DateTime? createdAt;

  NoteParams({
    required this.id,
    required this.title,
    this.content,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      DatabaseKeys.notesTitle: title,
      DatabaseKeys.notesContent: content,
      DatabaseKeys.notesCreatedAt: createdAt?.toIso8601String(),
    };
  }
}
