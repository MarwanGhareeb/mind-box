import 'package:animated_text_kit2/animated_text_kit2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/note_card.dart';

class NotesViewAnimated extends StatefulWidget {
  const NotesViewAnimated({super.key});
  @override
  State<NotesViewAnimated> createState() => _NotesViewAnimatedState();
}

class _NotesViewAnimatedState extends State<NotesViewAnimated> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<NotesBloc, NotesState, List<NoteEntity>>(
      selector: (state) {
        if (state is NotesLoaded) {
          return state.notes;
        }
        return [];
      },
      builder: (context, notes) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 30, bottom: 60),
          physics: BouncingScrollPhysics(),
          itemCount: notes.isEmpty ? 2 : notes.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return const MindBoxWidget();
            } else {
              if (notes.isEmpty) {
                return Column(
                  children: [
                    SizedBox(height: 100),
                    RepaintBoundary(
                      child: AnimatedTextKit2.Wave(
                        text: "Start Creating",
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        repeat: true,
                        amplitude: 2,
                      ),
                    ),
                  ],
                );
              } else {
                final NoteEntity note = notes[i - 1];
                return NoteCard(
                  key: ValueKey(note.id),
                  note: note,
                  onDelete: () => _onDelete(context, note: note),
                );
              }
            }
          },
        );
      },
    );
  }

  void _onDelete(BuildContext context, {required NoteEntity note}) {
    context.read<NotesBloc>().add(DeleteNoteEvent(id: note.id));
  }
}
