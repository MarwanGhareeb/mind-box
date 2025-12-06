import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  // ==================== Gradients ====================

  /// Main background gradient for the entire app
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.backgroundGradientStart,
      AppColors.backgroundGradientMiddle,
      AppColors.backgroundGradientEnd,
    ],
  );

  /// Brain/Logo gradient for MindBoxWidget
  static const brainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.brainGradientStart,
      AppColors.brainGradientEnd,
    ],
  );

  /// Task pending gradient
  static const taskPendingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.taskPendingStart,
      AppColors.taskPendingEnd,
    ],
  );

  /// Task completed gradient
  static const taskCompletedGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.taskCompletedStart,
      AppColors.taskCompletedEnd,
    ],
  );

  // ==================== ThemeData ====================

  /// Main app theme - unified theme using all design tokens
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Scaffold
      scaffoldBackgroundColor: AppColors.transparent,

      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: AppColors.fabNote,
        secondary: AppColors.fabTask,
        error: AppColors.deleteIcon,
        surface: AppColors.surfaceMedium,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onError: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        brightness: Brightness.dark,
      ),

      // Text Theme
      textTheme: AppTextStyles.textTheme,

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
        ),
        titleTextStyle: AppTextStyles.headlineLarge,
        centerTitle: false,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.surfaceMedium,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadowColor: AppColors.shadowSoft,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.fabNote,
        foregroundColor: AppColors.textPrimary,
        elevation: 6,
        highlightElevation: 8,
        shape: const CircleBorder(),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fabNote,
          foregroundColor: AppColors.textPrimary,
          elevation: 6,
          shadowColor: AppColors.shadowSoft,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTextStyles.button,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(
            color: AppColors.borderMedium,
            width: 1,
          ),
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        hintStyle: AppTextStyles.hint,
        errorStyle: AppTextStyles.error,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: AppColors.deleteIcon,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: AppColors.deleteIcon,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceMedium,
        selectedItemColor: AppColors.fabNote,
        unselectedItemColor: AppColors.textTertiary,
        selectedLabelStyle: AppTextStyles.labelMedium,
        unselectedLabelStyle: AppTextStyles.labelMedium,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceMedium,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        titleTextStyle: AppTextStyles.headlineLarge,
        contentTextStyle: AppTextStyles.bodyLarge,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surfaceMedium,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.fabNote,
        linearTrackColor: AppColors.surfaceLight,
        circularTrackColor: AppColors.surfaceLight,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1,
        space: 1,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedColor: AppColors.fabNote,
        labelStyle: AppTextStyles.bodyMedium,
        secondaryLabelStyle: AppTextStyles.bodyMedium,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceStrong,
        contentTextStyle: AppTextStyles.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
