import 'package:animated_text_kit2/animated_text_kit2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/note_card.dart';

class NotesViewAnimated extends StatelessWidget {
  const NotesViewAnimated({super.key});
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
        return notes.isEmpty
            ? Center(
                heightFactor: 6,
                child: RepaintBoundary(
                  child: AnimatedTextKit2.Wave(
                    text: "Start Creating",
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    repeat: true,
                    amplitude: 2,
                  ),
                ),
              )
            : _tasksList(context, notes);
      },
    );
  }

  Column _tasksList(BuildContext context, List<NoteEntity> notes) {
    return Column(
      children: List.generate(
        notes.length,
        (i) {
          return NoteCard(
            key: ValueKey(notes[i].id),
            note: notes[i],
            onDelete: () =>
                context.read<NotesBloc>().add(DeleteNoteEvent(id: notes[i].id)),
          );
        },
      ),
    );
  }
}
