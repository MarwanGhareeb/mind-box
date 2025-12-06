import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

class SaveButton extends StatelessWidget {
  final void Function() onSave;
  const SaveButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: AppColors.fabNote,
        foregroundColor: AppColors.textPrimary,
        shadowColor: AppColors.shadowSoft,
        elevation: 6,
      ),
      onPressed: onSave,
      child: Text(
        "Save",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
