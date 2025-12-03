import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/add_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final GlobalKey<AnimatedListState> _listNotesKey =
      GlobalKey<AnimatedListState>();

  int _notesLength = 0;

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
              return _notesViewAnimated();
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

  Widget _notesViewAnimated() {
    return BlocSelector<NotesBloc, NotesState, List<NoteEntity>>(
      selector: (state) {
        if (state is NotesLoaded) {
          return state.notes;
        }
        return [];
      },
      builder: (context, notes) {
        _notesLength = notes.length;

        return AnimatedList(
          key: _listNotesKey,
          padding: EdgeInsets.only(top: 20, bottom: 70),
          physics: BouncingScrollPhysics(),
          initialItemCount: _notesLength + 1,
          itemBuilder: (context, i, animation) {
            if (i == 0) {
              return const Center(child: MindBoxWidget());
            } else if (i - 1 < notes.length) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutBack,
                  ),
                ),
                child: ScaleTransition(
                  scale: animation,
                  child: NoteCard(
                    key: ValueKey(notes[i - 1].id),
                    note: notes[i - 1],
                    onDelete: () => _onPressDelete(notes[i - 1], index: i),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  void _onPressDelete(NoteEntity note, {required int index}) async {
    context.read<NotesBloc>().add(DeleteNoteEvent(id: note.id));

    await Future.delayed(Duration(milliseconds: 5));

    _listNotesKey.currentState!.removeItem(
      index,
      (context, animation) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
            animation,
          ),
          child: ScaleTransition(
            scale: animation,
            child: NoteCard(
              key: ValueKey(note.id),
              note: note,
              onDelete: () {},
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 800),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    void onPressed() async {
      final bloc = context.read<NotesBloc>();

      final bool res = await Navigator.push(
        context,
        createTransparentRoute(
          BlocProvider.value(
            value: bloc,
            child: AddNoteScreen(),
          ),
        ),
      );

      if (res) {
        _listNotesKey.currentState!.insertItem(
          _notesLength + 1,
          duration: Duration(milliseconds: 1200),
        );
      }
    }

    return FloatingActionButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child:
          IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.add)),
    );
  }
}
