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
  final Set<int> _notesWasAnimated = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        MindBoxWidget(),
        Expanded(
          child: BlocSelector<NotesBloc, NotesState, List<NoteEntity>>(
            selector: (state) {
              if (state is NotesLoaded) {
                return state.notes;
              }
              return [];
            },
            builder: (context, notes) {
              if (notes.isEmpty) {
                return Center(
                  child: RepaintBoundary(
                    child: AnimatedTextKit2.Wave(
                      text: "Start Creating",
                      repeat: true,
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      amplitude: 2,
                    ),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 60),
                physics: BouncingScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, i) {
                  final NoteEntity note = notes[i];
                  final bool isAnimated = _notesWasAnimated.contains(note.id);

                  _notesWasAnimated.add(note.id);

                  return NoteCard(
                    key: ValueKey(note.id),
                    note: note,
                    isAnimated: isAnimated,
                    onDelete: () =>
                        _onDelete(context, note: note, index: i - 1),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _onDelete(BuildContext context,
      {required NoteEntity note, required int index}) {
    context.read<NotesBloc>().add(DeleteNoteEvent(id: note.id));
    _notesWasAnimated.remove(note.id);
  }
}
