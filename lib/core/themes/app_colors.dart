import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ==================== Primary Background Gradients ====================

  /// Main background gradient - Deep purple to indigo (calm and modern)
  static const backgroundGradientStart = Color(0xFF1E1130); // Deep navy blue
  static const backgroundGradientMiddle = Color(0xFF7449C3); // Rich purple
  static const backgroundGradientEnd = Color(0xFF611580); // Deep purple-black

  /// Brain/Logo gradient - Soft pink to purple (vibrant but not harsh)
  static const brainGradientStart = Color(0xFFE879F9); // Soft pink-purple
  static const brainGradientEnd = Color(0xFFA78BFA); // Lavender purple

  // ==================== Task Status Colors ====================

  /// Task pending - Calm blue gradient
  static const taskPendingStart = Color(0xFF7DD3FC); // Sky blue
  static const taskPendingEnd = Color(0xFF3B82F6); // Bright blue
  static const taskPendingIcon = Color(0xFF93C5FD); // Light blue

  /// Task completed - Fresh green gradient
  static const taskCompletedStart = Color(0xFF6EE7B7); // Mint green
  static const taskCompletedEnd = Color(0xFF10B981); // Emerald green
  static const taskCompletedIcon = Color(0xFF34D399); // Medium green
  static const taskCompletedText = Color(0xB3FFFFFF); // White with 70% opacity

  // ==================== FAB (Floating Action Button) Colors ====================

  /// FAB for Notes - Warm amber/orange (inviting and friendly)
  static const fabNote = Color(0xFFFBBF24); // Amber

  /// FAB for Tasks - Cool blue (professional and clear)
  static const fabTask = Color(0xFF3B82F6); // Blue
  static const fabTaskHover = Color(0xFF2563EB); // Darker blue

  // ==================== Action Colors ====================

  /// Delete action - Soft red (not too aggressive)
  static const deleteBackground = Color(0xB3EF4444); // Red with 70% opacity
  static const deleteIcon = Color(0xFFF87171); // Soft red
  static const deleteHover = Color(0xFFDC2626); // Darker red

  /// Edit action - Soft blue
  static const editBackground = Color(0x803B82F6); // Blue with 50% opacity
  static const editIcon = Color(0xFF60A5FA); // Light blue

  // ==================== Glass/Transparency Effects ====================

  /// Glass morphism effects with varying opacity
  static const glass05 = Color(0x0DFFFFFF); // 5% opacity
  static const glass10 = Color(0x1AFFFFFF); // 10% opacity
  static const glass15 = Color(0x26FFFFFF); // 15% opacity
  static const glass20 = Color(0x33FFFFFF); // 20% opacity
  static const glass25 = Color(0x40FFFFFF); // 25% opacity
  static const glass30 = Color(0x4DFFFFFF); // 30% opacity
  static const glass40 = Color(0x66FFFFFF); // 40% opacity
  static const glass50 = Color(0x80FFFFFF); // 50% opacity

  // ==================== Overlay/Backdrop Colors ====================

  /// Dark overlays for modals and dialogs
  static const overlayLight = Color(0x4D000000); // 30% opacity
  static const overlayMedium = Color(0x66000000); // 40% opacity
  static const overlayDark = Color(0x80000000); // 50% opacity

  // ==================== Text Colors ====================

  /// Primary text colors
  static const textPrimary = Color(0xFFFFFFFF); // Pure white
  static const textSecondary = Color(0xFFE9D5FF); // Soft lavender
  static const textTertiary = Color(0xFFC4B5FD); // Medium lavender
  static const textDisabled = Color(0x80FFFFFF); // White with 50% opacity

  /// Text on colored backgrounds
  static const textOnDark = Color(0xFFFFFFFF);
  static const textOnLight = Color(0xFF1F2937); // Dark gray

  // ==================== Border Colors ====================

  /// Border colors with glass effect
  static const borderLight = Color(0x26FFFFFF); // 15% opacity
  static const borderMedium = Color(0x33FFFFFF); // 20% opacity
  static const borderStrong = Color(0x4DFFFFFF); // 30% opacity
  static const borderSolid = Color(0xFFFFFFFF); // Solid white

  // ==================== Shadow Colors ====================

  /// Shadow colors for depth
  static const shadowSoft = Color(0x40000000); // 25% opacity - soft shadow
  static const shadowMedium = Color(0x50000000); // 31% opacity - medium shadow
  static const shadowStrong = Color(0x66000000); // 40% opacity - strong shadow

  // ==================== Accent Colors ====================

  /// Accent colors for highlights and special elements
  static const accentPurple = Color(0xFFA78BFA); // Lavender
  static const accentPink = Color(0xFFEC4899); // Pink
  static const accentBlue = Color(0xFF60A5FA); // Sky blue
  static const accentGreen = Color(0xFF34D399); // Mint green
  static const accentAmber = Color(0xFFFBBF24); // Amber

  // ==================== Surface Colors ====================

  /// Surface colors for cards and containers
  static const surfaceLight = Color(0x1AFFFFFF); // 10% opacity
  static const surfaceMedium = Color(0x33FFFFFF); // 20% opacity
  static const surfaceStrong = Color(0x4DFFFFFF); // 30% opacity

  // ==================== Utility Colors ====================

  static const transparent = Colors.transparent;
  static const white = Colors.white;
  static const black = Colors.black;

  // ==================== Helper Methods ====================

  static Color whiteWithAlpha(double alpha) {
    assert(alpha >= 0.0 && alpha <= 1.0, 'Alpha must be between 0.0 and 1.0');
    return Colors.white.withValues(alpha: alpha);
  }

  static Color blackWithAlpha(double alpha) {
    assert(alpha >= 0.0 && alpha <= 1.0, 'Alpha must be between 0.0 and 1.0');
    return Colors.black.withValues(alpha: alpha);
  }

  static Color colorWithAlpha(Color color, double alpha) {
    assert(alpha >= 0.0 && alpha <= 1.0, 'Alpha must be between 0.0 and 1.0');
    return color.withValues(alpha: alpha);
  }
}
