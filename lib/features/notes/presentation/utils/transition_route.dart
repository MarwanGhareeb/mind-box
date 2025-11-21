// ignore_for_file: unused_element

import 'package:flutter/material.dart';

Route createTransparentRoute(Widget screen) {
  // return MaterialPageRoute(
  //   builder: (context) {
  //     return TweenAnimationBuilder(
  //       tween: Tween(),
  //       duration: Duration(microseconds: 600),
  //       builder: (context, value, child) {
  //         return child!;
  //       },
  //     );
  //   },
  // );

  return PageRouteBuilder(
    opaque: false,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    transitionDuration: const Duration(milliseconds: 400),
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
          child: child,
        ),
      );
    },
  );
}
