import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_gradients.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/add_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/notes_view_animated.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.scaffoldBackgroundGradient,
        ),
        child: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            if (state is NotesLoading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            } else if (state is NotesError) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is NotesLoaded) {
              return NotesViewAnimated();
            }
            return Container(
              margin: EdgeInsets.all(30),
            );
          },
        ),
      ),
      floatingActionButton: _floatingActionButton(context),
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
      backgroundColor: AppColors.fabNote,
      child: Icon(
        Icons.add,
        size: 27,
      ),
    );
  }
}
