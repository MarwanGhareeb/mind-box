import 'package:flutter/material.dart';

class MindBoxTheme {
  // Main Background Gradient
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4A148C),
      Color(0xFF1E1B4B),
      Color(0xFFAD1457),
    ],
  );

  // Task Status (Pending – Completed)

  static const taskPendingGradient = LinearGradient(
    colors: [
      Color(0xFF60A5FA),
      Color(0xFF3F51B5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const taskCompletedGradient = LinearGradient(
    colors: [
      Color(0xFF4ADE80),
      Color(0xFF10B981),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const taskPendingIcon = Color(0xFF93C5FD);
  static const taskCompletedIcon = Color(0xFF4ADE80);
  static const taskCompletedText = Color(0x80FFFFFF);

  // FABs
  static const fabNoteGradient = LinearGradient(
    colors: [
      Color(0xFFFACC15),
      Color(0xFFFB923C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const fabTaskGradient = LinearGradient(
    colors: [
      Color(0xFF60A5FA),
      Color(0xFF3949AB),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Delete Button
  static const deleteBackground = Color(0x80EF4444);
  static const deleteIconColor = Color(0xFFFCA5A5);

  // Glass Backgrounds
  static const glass10 = Color(0x1AFFFFFF);
  static const glass20 = Color(0x33FFFFFF);

  // Text Theme
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFDCC7F5),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFFDCC7F5),
    ),
  );

  // ThemeData
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: textTheme,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );
}
