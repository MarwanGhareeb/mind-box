import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_text_styles.dart';

class LightTheme {
  const LightTheme._();

  static TextTheme get textTheme => TextTheme(
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
      );

  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentAmber,
          elevation: 30,
          textStyle: AppTextStyles.labelLarge,
          foregroundColor: AppColors.black,
        ),
      );

  static InputDecorationThemeData get inputDecorationTheme =>
      InputDecorationThemeData(
        hintStyle: AppTextStyles.labelMedium,
        errorStyle: AppTextStyles.labelMedium.copyWith(
          color: AppColors.deleteHover,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(13),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.deleteHover,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.deleteHover,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        filled: true,
      );
}
