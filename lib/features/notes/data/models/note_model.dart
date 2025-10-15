import 'package:note_todo_app_mind_box/core/databases/local/database_keys.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';

class NoteModel {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json[DatabaseKeys.notesId],
    title: json[DatabaseKeys.notesTitle],
    content: json[DatabaseKeys.notesContent],
    createdAt: DateTime.parse(json[DatabaseKeys.notesCreatedAt]),
  );

  NoteEntity toEntity() =>
      NoteEntity(id: id, title: title, content: content, createdAt: createdAt);

  Map<String, dynamic> toJson() => {
    DatabaseKeys.notesId: id,
    DatabaseKeys.notesTitle: title,
    DatabaseKeys.notesContent: content,
    DatabaseKeys.notesCreatedAt: createdAt.toIso8601String(),
  };
}
