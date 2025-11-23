// ignore_for_file: unused_element

import 'dart:ui';

import 'package:flutter/material.dart';

Route createTransparentRoute(Widget screen) {
  return PageRouteBuilder(
    opaque: false,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: animation,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.transparent,
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
