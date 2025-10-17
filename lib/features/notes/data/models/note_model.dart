import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
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
    id: json[NotesDBKeys.notesId],
    title: json[NotesDBKeys.notesTitle],
    content: json[NotesDBKeys.notesContent],
    createdAt: DateTime.parse(json[NotesDBKeys.notesCreatedAt]),
  );

  NoteEntity toEntity() =>
      NoteEntity(id: id, title: title, content: content, createdAt: createdAt);

  Map<String, dynamic> toJson() => {
    NotesDBKeys.notesId: id,
    NotesDBKeys.notesTitle: title,
    NotesDBKeys.notesContent: content,
    NotesDBKeys.notesCreatedAt: createdAt.toIso8601String(),
  };
}
