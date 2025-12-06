import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

class AppShadows {
  const AppShadows._();

  // ==================== Card Shadows ====================

  /// Soft shadow for note cards - subtle elevation
  static const cardSoft = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 8,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  /// Medium shadow for note cards - standard elevation
  static const cardMedium = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 15,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  /// Strong shadow for note cards - high elevation
  static const cardStrong = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 20,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  // ==================== Button Shadows ====================

  /// Soft shadow for buttons - subtle elevation
  static const buttonSoft = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 6,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  /// Medium shadow for buttons - standard elevation (SaveButton, FAB)
  static const buttonMedium = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 12,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  /// Strong shadow for buttons - high elevation
  static const buttonStrong = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 18,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  /// Edit button shadow - used in NoteCard edit button
  static const editButton = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 15,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  // ==================== Icon/Logo Shadows ====================

  /// Brain icon shadow - used in MindBoxWidget
  static const brainIcon = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 15,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  /// Icon shadow - for decorative icons
  static const iconSoft = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 8,
      offset: Offset(0, 3),
      spreadRadius: 0,
    ),
  ];

  /// Icon shadow - for important icons
  static const iconMedium = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 12,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  // ==================== Container Shadows ====================

  /// MindBox container shadow - used in MindBoxWidget main container
  static const containerSoft = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 10,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  /// Container shadow - for glass morphism containers
  static const containerMedium = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 16,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  /// Container shadow - for prominent containers
  static const containerStrong = [
    BoxShadow(
      color: AppColors.shadowStrong,
      blurRadius: 24,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  // ==================== AppBar Shadows ====================

  /// AppBar shadow - subtle elevation for glass morphism
  static const appBar = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  // ==================== FAB Shadows ====================

  /// FAB shadow - for floating action buttons
  static const fab = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 12,
      offset: Offset(0, 4),
      spreadRadius: 2,
    ),
  ];

  /// FAB shadow - elevated state
  static const fabElevated = [
    BoxShadow(
      color: AppColors.shadowStrong,
      blurRadius: 20,
      offset: Offset(0, 8),
      spreadRadius: 4,
    ),
  ];

  // ==================== Modal/Dialog Shadows ====================

  /// Modal shadow - for dialogs and bottom sheets
  static const modal = [
    BoxShadow(
      color: AppColors.shadowStrong,
      blurRadius: 30,
      offset: Offset(0, 10),
      spreadRadius: 0,
    ),
  ];

  // ==================== Text Shadows ====================

  /// Text shadow - for text on complex backgrounds
  static const textSoft = [
    Shadow(
      color: AppColors.shadowSoft,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  /// Text shadow - for prominent text
  static const textMedium = [
    Shadow(
      color: AppColors.shadowMedium,
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ];

  // ==================== Inner Shadows ====================

  /// Inner shadow - for inset effects
  static const inner = [
    BoxShadow(
      color: AppColors.shadowSoft,
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -2,
    ),
  ];

  // ==================== Custom Shadow Builder ====================

  /// Create custom shadow with specified parameters
  static List<BoxShadow> custom({
    required Color color,
    required double blurRadius,
    required Offset offset,
    double spreadRadius = 0,
  }) {
    return [
      BoxShadow(
        color: color,
        blurRadius: blurRadius,
        offset: offset,
        spreadRadius: spreadRadius,
      ),
    ];
  }

  /// Create multiple layered shadows for depth
  static List<BoxShadow> layered({
    Color? primaryColor,
    Color? secondaryColor,
    double blurRadius = 15,
    Offset offset = const Offset(0, 6),
  }) {
    return [
      BoxShadow(
        color: secondaryColor ?? AppColors.shadowSoft,
        blurRadius: blurRadius * 1.5,
        offset: offset,
        spreadRadius: 0,
      ),
      BoxShadow(
        color: primaryColor ?? AppColors.shadowSoft,
        blurRadius: blurRadius,
        offset: offset,
        spreadRadius: 0,
      ),
    ];
  }
}
