import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_shadows.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';
import 'package:note_todo_app_mind_box/core/widgets/custom_delete_button.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/edit_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/note_details_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';

class NoteCard extends StatefulWidget {
  final NoteEntity note;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
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

  late Color foregroundColor;

  @override
  void initState() {
    foregroundColor = Color(widget.note.color).computeLuminance() > 0.5
        ? AppColors.textOnLight
        : AppColors.textOnDark;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animationOffset = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationScale =
        Tween<double>(begin: 1, end: -0.7).animate(_animationController);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant NoteCard oldWidget) {
    if (widget != oldWidget) {
      foregroundColor = Color(widget.note.color).computeLuminance() > 0.5
          ? AppColors.textOnLight
          : AppColors.textOnDark;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          createTransparentRoute(
            NoteDetailsScreen(note: widget.note),
            isOpaque: true,
          ),
        );
      },
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: foregroundColor),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.note.content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: foregroundColor),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _editButton(context),
                        SizedBox(width: 10),
                        CustomDeleteButton(
                          onPressed: _onPressDeleteButton,
                          feature: Feature.notes,
                        ),
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
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.whiteWithAlpha(0.5),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderSolid, width: 1),
        boxShadow: AppShadows.buttonStrong,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.edit_outlined,
          color: foregroundColor,
          size: 27,
        ),
      ),
    );
  }

  void _onPressDeleteButton() {
    _animationController.forward().then(
          (_) => widget.onDelete(),
        );
  }
}
