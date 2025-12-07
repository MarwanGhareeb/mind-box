import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_gradients.dart';
import 'package:note_todo_app_mind_box/core/themes/app_shadows.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteWithAlpha(0.2),
      leading: _starIcon(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: AppColors.blackWithAlpha(0.1),
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
            border: Border.all(color: AppColors.white, width: 0.15),
          ),
          child: FloatingActionButton.small(
            heroTag: "appBar",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () => Navigator.pop<bool>(context, false),
            backgroundColor: AppColors.whiteWithAlpha(0.05),
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
        gradient: AppGradients.scaffoldBackgroundGradient,
        borderRadius: BorderRadius.circular(13),
        boxShadow: AppShadows.containerStrong,
      ),
      child: Icon(
        Icons.star_border_outlined,
        size: 28,
      ),
    );
  }
}
