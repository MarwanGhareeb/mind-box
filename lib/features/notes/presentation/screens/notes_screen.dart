import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/add_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/note_card.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: MindBoxTheme.backgroundGradient,
        ),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoading) {
              return Center(
                child: const CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is NotesError) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is NotesLoaded) {
              return _notesView();
            }
            return Container(
              margin: EdgeInsets.all(30),
              color: Colors.grey[600],
            );
          },
        ),
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _notesView() {
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
          itemCount: notes.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return const Center(child: MindBoxWidget());
            } else if (i - 1 < notes.length) {
              return NoteCard(
                key: ValueKey(notes[i - 1].id),
                note: notes[i - 1],
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    void onPressed() async {
      final bloc = context.read<NotesBloc>();

      await Navigator.push(
        context,
        createTransparentRoute(
          BlocProvider.value(
            value: bloc,
            child: AddNoteScreen(),
          ),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child:
          IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.add)),
    );
  }
}
