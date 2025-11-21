import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.4),
      title: Row(
        children: [
          _starIcon(),
          SizedBox(width: 20),
          Text(title),
        ],
      ),
      centerTitle: false,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      automaticallyImplyLeading: false,
    );
  }

  Container _starIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: MindBoxTheme.orange,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        Icons.star_border_outlined,
        size: 30,
      ),
    );
  }
}
