import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';

class NoteModel {
  final int id;
  final String title;
  final String content;
  final int color;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json[NotesDBKeys.notesId],
        title: json[NotesDBKeys.notesTitle],
        content: json[NotesDBKeys.notesContent],
        color: json[NotesDBKeys.notesColor],
      );

  NoteEntity toEntity() =>
      NoteEntity(id: id, title: title, content: content, color: color);

  Map<String, dynamic> toJson() => {
        NotesDBKeys.notesId: id,
        NotesDBKeys.notesTitle: title,
        NotesDBKeys.notesContent: content,
        NotesDBKeys.notesColor: color,
      };
}
