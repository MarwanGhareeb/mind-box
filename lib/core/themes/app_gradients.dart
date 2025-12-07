import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

class AppGradients {
  const AppGradients._();

  static LinearGradient get scaffoldBackgroundGradient => LinearGradient(
        colors: [
          AppColors.backgroundGradientStart,
          AppColors.backgroundGradientMiddle,
          AppColors.backgroundGradientEnd,
        ],
        begin: AlignmentGeometry.topLeft,
        end: AlignmentGeometry.bottomRight,
        tileMode: TileMode.mirror,
      );

  static LinearGradient get brainBackgroundGradient => LinearGradient(
        colors: [
          AppColors.brainGradientStart,
          AppColors.brainGradientEnd,
        ],
        begin: AlignmentGeometry.centerLeft,
        end: AlignmentGeometry.centerRight,
        tileMode: TileMode.mirror,
      );
}
