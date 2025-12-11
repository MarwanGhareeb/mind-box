import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({
    super.key,
    required this.onPressed,
    required this.feature,
  });

  final VoidCallback onPressed;
  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: feature == Feature.notes ? 50 : 40,
      width: feature == Feature.notes ? 50 : 40,
      decoration: BoxDecoration(
        color: AppColors.deleteIcon,
        borderRadius: BorderRadius.circular(feature == Feature.notes ? 16 : 13),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          CupertinoIcons.delete,
          color: AppColors.white,
          size: feature == Feature.notes ? 27 : 18,
        ),
      ),
    );
  }
}
