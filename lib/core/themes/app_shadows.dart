import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  // ==================== Card Shadows ====================

  /// Soft shadow for cards - subtle elevation
  static List<BoxShadow> get cardSoft => [
        BoxShadow(
          color: AppColors.shadowSoft,
          blurRadius: 8,
          offset: const Offset(0, 2),
          spreadRadius: 0,
        ),
      ];

  /// Medium shadow for cards - standard elevation
  static List<BoxShadow> get cardMedium => [
        BoxShadow(
          color: AppColors.shadowMedium,
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        ),
      ];

  /// Strong shadow for cards - high elevation
  static List<BoxShadow> get cardStrong => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 16,
          offset: const Offset(0, 6),
          spreadRadius: 0,
        ),
      ];

  // ==================== Button Shadows ====================

  /// Soft shadow for buttons - subtle depth
  static List<BoxShadow> get buttonSoft => [
        BoxShadow(
          color: AppColors.shadowSoft,
          blurRadius: 6,
          offset: const Offset(0, 2),
          spreadRadius: 0,
        ),
      ];

  /// Medium shadow for buttons - standard depth
  static List<BoxShadow> get buttonMedium => [
        BoxShadow(
          color: AppColors.shadowMedium,
          blurRadius: 10,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        ),
      ];

  /// Strong shadow for buttons - pressed/elevated state
  static List<BoxShadow> get buttonStrong => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 15,
          offset: const Offset(0, 6),
          spreadRadius: 5,
        ),
      ];

  // ==================== FAB Shadows ====================

  /// Shadow for Floating Action Buttons
  static List<BoxShadow> get fab => [
        BoxShadow(
          color: AppColors.shadowMedium,
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: 2,
        ),
      ];

  /// Elevated shadow for FAB when pressed
  static List<BoxShadow> get fabElevated => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 20,
          offset: const Offset(0, 8),
          spreadRadius: 4,
        ),
      ];

  // ==================== Container Shadows ====================

  /// Soft shadow for containers - minimal elevation
  static List<BoxShadow> get containerSoft => [
        BoxShadow(
          color: AppColors.shadowSoft,
          blurRadius: 10,
          offset: const Offset(0, 3),
          spreadRadius: 0,
        ),
      ];

  /// Medium shadow for containers - standard elevation
  static List<BoxShadow> get containerMedium => [
        BoxShadow(
          color: AppColors.shadowMedium,
          blurRadius: 15,
          offset: const Offset(0, 6),
          spreadRadius: 0,
        ),
      ];

  /// Strong shadow for containers - high elevation
  static List<BoxShadow> get containerStrong => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 20,
          offset: const Offset(0, 8),
          spreadRadius: 0,
        ),
      ];

  // ==================== Modal/Dialog Shadows ====================

  /// Shadow for modals and dialogs
  static List<BoxShadow> get modal => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 24,
          offset: const Offset(0, 12),
          spreadRadius: 0,
        ),
      ];

  /// Shadow for bottom sheets
  static List<BoxShadow> get bottomSheet => [
        BoxShadow(
          color: AppColors.shadowStrong,
          blurRadius: 20,
          offset: const Offset(0, -4),
          spreadRadius: 0,
        ),
      ];

  // ==================== Text Shadows ====================

  /// Soft text shadow for readability
  static Shadow get textSoft => Shadow(
        color: AppColors.shadowSoft,
        blurRadius: 4,
        offset: const Offset(0, 2),
      );

  /// Medium text shadow for better readability
  static Shadow get textMedium => Shadow(
        color: AppColors.shadowMedium,
        blurRadius: 6,
        offset: const Offset(0, 2),
      );

  /// Strong text shadow for high contrast
  static Shadow get textStrong => Shadow(
        color: AppColors.shadowStrong,
        blurRadius: 8,
        offset: const Offset(0, 2),
      );

  // ==================== Inner Shadows ====================

  /// Inner shadow for inset effects
  static List<BoxShadow> get inner => [
        BoxShadow(
          color: AppColors.shadowSoft,
          blurRadius: 8,
          offset: const Offset(0, 2),
          spreadRadius: -2,
        ),
      ];

  // ==================== Glow Effects ====================

  /// Soft glow effect for special elements
  static List<BoxShadow> get glowSoft => [
        BoxShadow(
          color: AppColors.accentPurple.withValues(alpha: 0.3),
          blurRadius: 12,
          offset: const Offset(0, 0),
          spreadRadius: 2,
        ),
      ];

  /// Medium glow effect for highlighted elements
  static List<BoxShadow> get glowMedium => [
        BoxShadow(
          color: AppColors.accentBlue.withValues(alpha: 0.4),
          blurRadius: 16,
          offset: const Offset(0, 0),
          spreadRadius: 4,
        ),
      ];

  /// Strong glow effect for active elements
  static List<BoxShadow> get glowStrong => [
        BoxShadow(
          color: AppColors.accentPink.withValues(alpha: 0.5),
          blurRadius: 20,
          offset: const Offset(0, 0),
          spreadRadius: 6,
        ),
      ];

  // ==================== Custom Shadow Builder ====================

  /// Create a custom shadow with specified parameters
  static BoxShadow custom({
    required Color color,
    required double blurRadius,
    required Offset offset,
    double spreadRadius = 0,
  }) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      offset: offset,
      spreadRadius: spreadRadius,
    );
  }

  /// Create a list of shadows for elevation effect
  static List<BoxShadow> elevation({
    required double elevation,
    Color? color,
  }) {
    final shadowColor = color ?? AppColors.shadowMedium;
    return [
      BoxShadow(
        color: shadowColor,
        blurRadius: elevation * 2,
        offset: Offset(0, elevation),
        spreadRadius: elevation * 0.1,
      ),
    ];
  }
}
