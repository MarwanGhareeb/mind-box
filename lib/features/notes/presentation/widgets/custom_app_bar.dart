import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.glass40,
      elevation: 0,
      leading: _starIcon(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: AppColors.overlayLight,
          ),
        ),
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderLight, width: 0.15),
          ),
          child: FloatingActionButton.small(
            heroTag: "appBar",
            onPressed: () => Navigator.pop<bool>(context, false),
            backgroundColor: AppColors.glass05,
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Container _starIcon() {
    return Container(
      margin: EdgeInsets.all(6),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: AppTheme.backgroundGradient,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        Icons.star_border_outlined,
        size: 28,
        color: AppColors.textPrimary,
      ),
    );
  }
}
