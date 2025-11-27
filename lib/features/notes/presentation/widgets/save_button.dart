import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';

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
        backgroundColor: MindBoxTheme.lightTheme.colorScheme.primary,
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 6,
      ),
      onPressed: onSave,
      child: const Text(
        "Save",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
