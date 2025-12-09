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
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesBloc, NotesState>(
      listenWhen: (previous, current) => current is ScrollToLastNoteState,
      listener: (context, state) =>
          WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(
          Duration(milliseconds: 300),
          () => _scrollController
              .jumpTo(_scrollController.position.maxScrollExtent),
        ),
      ),
      child: BlocSelector<NotesBloc, NotesState, List<NoteEntity>>(
        selector: (state) {
          if (state is NotesLoaded) {
            return state.notes;
          }
          return [];
        },
        builder: (context, notes) {
          return _buildScrollView(notes);
        },
      ),
    );
  }

  void _onDelete(BuildContext context, {required NoteEntity note}) {
    context.read<NotesBloc>().add(DeleteNoteEvent(id: note.id));
  }

  CustomScrollView _buildScrollView(List<NoteEntity> notes) {
    final int notesCount = notes.length;

    return CustomScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 30),
          sliver: const SliverToBoxAdapter(
            child: MindBoxWidget(),
          ),
        ),
        if (notes.isEmpty)
          SliverPadding(
            padding: EdgeInsets.only(top: 100),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: RepaintBoundary(
                  child: AnimatedTextKit2.Wave(
                    text: "Start Creating",
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    repeat: true,
                    amplitude: 2,
                  ),
                ),
              ),
            ),
          )
        else
          SliverPadding(
            padding: EdgeInsets.only(bottom: 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: notesCount,
                (context, i) {
                  final NoteEntity note = notes[i];
                  return NoteCard(
                    key: ValueKey(note.id),
                    note: note,
                    onDelete: () => _onDelete(context, note: note),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
