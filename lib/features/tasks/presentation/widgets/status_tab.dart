import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final int count;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.whiteWithAlpha(0.3)
              : AppColors.whiteWithAlpha(0),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.whiteWithAlpha(isActive ? 0.8 : 0),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.accentGreen),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$count tasks",
                  style: TextStyle(
                    color: AppColors.whiteWithAlpha(0.8),
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
