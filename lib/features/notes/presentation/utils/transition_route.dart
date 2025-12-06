import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';

Route createTransparentRoute(Widget screen) {
  return PageRouteBuilder(
    opaque: false,
    barrierDismissible: true,
    barrierColor: AppColors.overlayLight,
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );

      final slide = Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(curved);

      return SlideTransition(
        position: slide,
        child: FadeTransition(
          opacity: curved,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: AppColors.overlayMedium,
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
