import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_fonts.dart';
import 'package:note_todo_app_mind_box/core/themes/app_shadows.dart';

class AppTextStyles {
  const AppTextStyles._();

  // ==================== Display Styles ====================

  /// Display Large - For hero text and main titles (64px)
  /// Used in: MindBoxWidget animated text, splash screens
  static const displayLarge = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w900,
    fontFamily: AppFonts.playfairDisplay,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -1.0,
  );

  /// Display Medium - For large section headers (48px)
  static const displayMedium = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    fontFamily: AppFonts.playfairDisplay,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  /// Display Small - For prominent titles (36px)
  static const displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.playfairDisplay,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0,
  );

  // ==================== Headline Styles ====================

  /// Headline Large - For main page titles (28px)
  /// Used in: CustomAppBar title, section headers
  static const headlineLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Headline Medium - For secondary titles (24px)
  static const headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Headline Small - For subsection titles (20px)
  static const headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0,
  );

  // ==================== Title Styles ====================

  /// Title Large - For card titles and form labels (22px)
  /// Used in: NoteCard title, form section labels
  static const titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Title Medium - For secondary card titles (18px)
  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Title Small - For small titles (16px)
  static const titleSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  // ==================== Body Styles ====================

  /// Body Large - For main content text (16px)
  /// Used in: NoteCard content, CustomTextField, form content
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: 0.15,
  );

  /// Body Medium - For secondary content text (14px)
  /// Used in: NoteCard content (secondary), small descriptions
  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Body Small - For small content text (12px)
  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.5,
    letterSpacing: 0.1,
  );

  // ==================== Label Styles ====================

  /// Label Large - For form labels and buttons (16px)
  /// Used in: Form labels (Title, Note, Pick a Color)
  static const labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Label Medium - For navigation and tabs (14px)
  /// Used in: Navigation labels, tab labels
  static const labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  /// Label Small - For small labels and captions (12px)
  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  // ==================== Button Styles ====================

  /// Button text style - For primary buttons
  /// Used in: SaveButton, FAB labels
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: 0.5,
  );

  /// Button small text style - For small buttons
  static const buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: 0.3,
  );

  // ==================== Hint/Placeholder Styles ====================

  /// Hint text style - For text field placeholders
  /// Used in: CustomTextField hintText
  static TextStyle hint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteWithAlpha(0.5),
    height: 1.5,
    letterSpacing: 0.15,
  );

  // ==================== Error Styles ====================

  /// Error text style - For validation errors
  /// Used in: CustomTextField error text
  static const error = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.deleteIcon,
    height: 1.4,
    letterSpacing: 0.1,
  );

  // ==================== Caption Styles ====================

  /// Caption style - For small descriptive text
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  // ==================== Overline Styles ====================

  /// Overline style - For very small labels and tags
  static const overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 0.5,
  );

  // ==================== TextTheme ====================

  /// Complete TextTheme for Material Design
  static const TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );

  // ==================== Helper Methods ====================

  /// Create custom text style with specified parameters
  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.textPrimary,
      height: height ?? 1.5,
      letterSpacing: letterSpacing ?? 0,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  /// Create text style with shadow for better readability
  static TextStyle withShadow(
    TextStyle baseStyle, {
    List<Shadow>? shadows,
  }) {
    return baseStyle.copyWith(
      shadows: shadows ?? AppShadows.textSoft,
    );
  }
}
