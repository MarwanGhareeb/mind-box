import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: MindBoxTheme.backgroundGradient,
        ),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoading) {
              return Center(
                  child: const CircularProgressIndicator(color: Colors.white));
            } else if (state is NotesLoaded) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 30, bottom: 60),
                physics: BouncingScrollPhysics(),
                itemCount: state.notes.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return const MindBoxWidget();
                  } else {
                    final note = state.notes[i - 1];
                    return NoteCard(
                      note: NoteParams(
                        id: note.id,
                        title: note.title,
                        content: note.content,
                        color: note.color,
                      ),
                    );
                  }
                },
              );
            } else if (state is NotesError) {
              return Center(
                child: Text(
                  state.message,
                  style: theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(30),
              color: Colors.grey[600],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add note",
        onPressed: () async {
          final bloc = context.read<NotesBloc>();

          final bool result = await Navigator.push(
            context,
            createTransparentRoute(
              BlocProvider.value(
                value: bloc,
                child: AddNoteScreen(),
              ),
            ),
          );

          if (result && context.mounted) {
            bloc.add(GetNotesEvent());
          }
        },
        shape: CircleBorder(),
        child: IconTheme(data: theme.iconTheme, child: Icon(Icons.add)),
      ),
    );
  }
}
