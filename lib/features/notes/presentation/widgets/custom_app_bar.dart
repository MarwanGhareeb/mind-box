import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.4),
      elevation: 0,
      leading: _starIcon(),
      title: Text(title),
      centerTitle: false,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Colors.black.withValues(alpha: 0.1),
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
            border: Border.all(color: Colors.white, width: 0.15),
          ),
          child: FloatingActionButton.small(
            heroTag: "appBar",
            onPressed: () => Navigator.pop(context),
            backgroundColor: Colors.white.withValues(alpha: 0.05),
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
        color: MindBoxTheme.orange,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        Icons.star_border_outlined,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
