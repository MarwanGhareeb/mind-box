import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/note_form_screen.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NoteFormScreen(
      title: "New Note",
    );
  }
}
