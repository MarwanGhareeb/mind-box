class NoteEntity {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });
}
