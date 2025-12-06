import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_theme.dart';

/// Legacy theme class - maintained for backward compatibility
/// All properties now reference the new unified theme system
class MindBoxTheme {
  const MindBoxTheme._();

  // ==================== Gradients ====================

  /// Main background gradient - uses AppTheme.backgroundGradient
  static LinearGradient get backgroundGradient => AppTheme.backgroundGradient;

  /// Brain gradient - uses AppTheme.brainGradient
  static LinearGradient get brainGradient => AppTheme.brainGradient;

  /// Task pending gradient - uses AppTheme.taskPendingGradient
  static LinearGradient get taskPendingGradient => AppTheme.taskPendingGradient;

  /// Task completed gradient - uses AppTheme.taskCompletedGradient
  static LinearGradient get taskCompletedGradient =>
      AppTheme.taskCompletedGradient;

  // ==================== Task Colors ====================

  /// Task pending icon color
  static const taskPendingIcon = AppColors.taskPendingIcon;

  /// Task completed icon color
  static const taskCompletedIcon = AppColors.taskCompletedIcon;

  /// Task completed text color
  static const taskCompletedText = AppColors.taskCompletedText;

  // ==================== FAB Colors ====================

  /// FAB for Notes - uses AppColors.fabNote
  static const fabNoteGradient = AppColors.fabNote;

  /// FAB for Tasks - uses AppColors.fabTask
  static const fabTaskGradient = AppColors.fabTask;

  // ==================== Delete Colors ====================

  /// Delete button background - uses AppColors.deleteBackground
  static const deleteBackground = AppColors.deleteBackground;

  /// Delete icon color - uses AppColors.deleteIcon
  static const deleteIconColor = AppColors.deleteIcon;

  // ==================== Glass Colors ====================

  /// Glass effect 10% opacity - uses AppColors.glass10
  static const glass10 = AppColors.glass10;

  /// Glass effect 20% opacity - uses AppColors.glass20
  static const glass20 = AppColors.glass20;

  // ==================== Theme Data ====================

  /// Main theme - uses AppTheme.theme
  static ThemeData get theme => AppTheme.theme;

  // ==================== Legacy Text Theme ====================

  /// Legacy text theme - maintained for backward compatibility
  /// New code should use AppTextStyles.textTheme
  static TextTheme get textTheme => AppTheme.theme.textTheme;
}
