import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'PlayfairDisplay';

  static TextStyle get displayMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        fontStyle: FontStyle.italic,
        letterSpacing: 0.5,
        height: 1.2,
      );

  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
        letterSpacing: 1.5,
        height: 1,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: AppColors.textPrimary,
        letterSpacing: -0.2,
        height: 1.3,
      );

  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
        letterSpacing: 0.3,
        height: 1.4,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: 0.15,
        height: 1.4,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondary,
        letterSpacing: 0.5,
        height: 1.5,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w900,
        letterSpacing: 1,
        height: 1.4,
      );

  static TextStyle get labelMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        height: 1.4,
      );
}
