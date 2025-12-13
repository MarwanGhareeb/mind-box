import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const backgroundGradientStart = Color(0xFF1E1130);
  static const backgroundGradientMiddle = Color(0xFF7449C3);
  static const backgroundGradientEnd = Color(0xFF611580);

  static const brainGradientStart = Color(0xFFE879F9);
  static const brainGradientEnd = Color(0xFFA78BFA);

  static const taskPendingStart = Color(0xFF7DD3FC);
  static const taskPendingEnd = Color(0xFF3B82F6);
  static const taskPendingIcon = Color(0xFF93C5FD);

  static const deleteIcon = Color(0xFFF87171);
  static const deleteHover = Color(0xFFDC2626);

  static const overlayDark = Color(0x80000000);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFE9D5FF);

  static const textOnDark = Color(0xFFFFFFFF);
  static const textOnLight = Color(0xFF1F2937);

  static const borderSolid = Color(0xFFFFFFFF);

  static const shadowSoft = Color(0x40000000);
  static const shadowMedium = Color(0x50000000);
  static const shadowStrong = Color(0x66000000);

  static const accentPurple = Color(0xFFA78BFA);
  static const accentPink = Color(0xFFEC4899);
  static const accentBlue = Color(0xFF60A5FA);
  static const accentGreen = Color(0xFF34D399);
  static const accentAmber = Color(0xFFFBBF24);

  static const white = Colors.white;
  static const black = Colors.black;

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
