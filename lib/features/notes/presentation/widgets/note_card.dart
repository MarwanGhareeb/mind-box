import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/edit_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';

class NoteCard extends StatelessWidget {
  final NoteEntity note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Card(
        color: Color(note.color),
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                note.content,
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _editButton(context),
                  SizedBox(width: 10),
                  _deleteButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _editButton(BuildContext context) {
    void onPressed() async {
      final bloc = context.read<NotesBloc>();

      await Navigator.push(
        context,
        createTransparentRoute(
          BlocProvider.value(
            value: bloc,
            child: EditNoteScreen(note: note),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton(
        heroTag: "edit_${note.id}",
        onPressed: onPressed,
        backgroundColor: Colors.white.withValues(alpha: 0.5),
        child: Icon(
          Icons.edit_outlined,
          size: 30,
        ),
      ),
    );
  }

  FloatingActionButton _deleteButton(BuildContext context) {
    void onPressed() async {
      final bloc = context.read<NotesBloc>();

      bloc.add(DeleteNoteEvent(id: note.id));
    }

    return FloatingActionButton(
      heroTag: "delete_${note.id}",
      onPressed: onPressed,
      backgroundColor: const Color.fromARGB(255, 255, 127, 127),
      child: Icon(
        CupertinoIcons.trash,
        size: 27,
      ),
    );
  }
}
