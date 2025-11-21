import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/note_form_screen.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({
    super.key,
    required this.note,
  });

  final NoteParams note;

  @override
  Widget build(BuildContext context) {
    return NoteFormScreen(
      appBarTitle: "Edit Note",
      initialNote: note,
    );
  }
}
