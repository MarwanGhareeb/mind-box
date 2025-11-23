import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';

class ActionButtons extends StatelessWidget {
  final void Function() onSave;
  final void Function() onCancle;
  const ActionButtons(
      {super.key, required this.onSave, required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _canclingButton(context),
        const SizedBox(width: 15),
        _savingButton(),
      ],
    );
  }

  Expanded _canclingButton(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.grey[800],
          side: BorderSide(color: Colors.grey.shade400, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.grey.shade100.withValues(alpha: 0.3),
        ),
        onPressed: onCancle,
        child: Text(
          "Cancel",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Expanded _savingButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: MindBoxTheme.lightTheme.colorScheme.primary,
          foregroundColor: Colors.white,
          shadowColor: MindBoxTheme.lightTheme.colorScheme.primary
              .withValues(alpha: 0.5),
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
      ),
    );
  }
}
