import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/edit_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';

class NoteCard extends StatefulWidget {
  final NoteEntity note;
  final bool isAnimated;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.isAnimated,
    required this.onDelete,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animationOffset;
  late final Animation<double> _animationScale;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      reverseDuration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationOffset = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationScale =
        Tween<double>(begin: -0.7, end: 1).animate(_animationController);

    if (!widget.isAnimated) {
      _animationController.forward();
    } else {
      _animationController.value = 1;
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: SizeTransition(
        sizeFactor: _animationScale,
        child: SlideTransition(
          position: _animationOffset,
          child: ScaleTransition(
            scale: _animationScale,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Color(widget.note.color),
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.title,
                      style: theme.textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.note.content,
                      style: theme.textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20),
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
            child: EditNoteScreen(note: widget.note),
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
        heroTag: "edit_${widget.note.id}",
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
    return FloatingActionButton(
      heroTag: "delete_${widget.note.id}",
      onPressed: () {
        _animationController.reverse().then(
              (_) => widget.onDelete(),
            );
      },
      backgroundColor: MindBoxTheme.deleteBackground,
      child: Icon(
        CupertinoIcons.trash,
        color: MindBoxTheme.deleteIconColor,
        size: 27,
      ),
    );
  }
}
