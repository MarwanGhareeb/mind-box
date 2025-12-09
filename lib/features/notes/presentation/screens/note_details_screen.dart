import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';

class NoteDetailsScreen extends StatelessWidget {
  final NoteEntity note;

  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(note.color);

    final Color textColor = bgColor.computeLuminance() > 0.5
        ? AppColors.textOnLight
        : AppColors.textOnDark;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Scrollbar(
            thumbVisibility: true,
            thickness: 10,
            radius: Radius.circular(20),
            interactive: true,
            child: ListView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 15,
                bottom: 50,
                top: 50,
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                Text(
                  note.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: textColor),
                ),
                const SizedBox(height: 20),
                Text(
                  note.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: AppColors.colorWithAlpha(textColor, 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.colorWithAlpha(textColor, 0.25),
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_downward,
            color: textColor,
            size: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
