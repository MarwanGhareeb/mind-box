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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 90,
                bottom: 30,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            Positioned(
              top: 10,
              left: 10,
              child: Container(
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
                    Icons.arrow_back_rounded,
                    color: textColor,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
