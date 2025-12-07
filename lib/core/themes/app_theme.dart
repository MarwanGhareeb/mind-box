import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/light_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        textTheme: LightTheme.textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackWithAlpha(0.15),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: CircleBorder(),
          foregroundColor: AppColors.white,
          elevation: 20,
        ),
        elevatedButtonTheme: LightTheme.elevatedButtonTheme,
        inputDecorationTheme: LightTheme.inputDecorationTheme,
      );
}
