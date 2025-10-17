import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: const Color(0xFF6750A4),
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF6750A4),
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF6750A4),
    foregroundColor: Colors.white,
    elevation: 6,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0xFF1C1B1F),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF1C1B1F),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF49454F),
      fontSize: 16,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF6750A4),
    size: 24,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 3,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6750A4),
    secondary: Color(0xFFEADDFF),
    surface: Colors.white,
    onPrimary: Colors.white,
    onSurface: Color(0xFF1C1B1F),
    error: Color(0xFFB3261E),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF6750A4),
    contentTextStyle: TextStyle(color: Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: const Color(0xFFD0BCFF),
  scaffoldBackgroundColor: const Color(0xFF121212),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFD0BCFF),
    foregroundColor: Colors.black,
    elevation: 4,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFFE6E1E5),
      fontSize: 16,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFD0BCFF),
    size: 24,
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF1E1E1E),
    elevation: 3,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD0BCFF),
    secondary: Color(0xFFCCC2DC),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.black,
    onSurface: Colors.white,
    error: Color(0xFFF2B8B5),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFFD0BCFF),
    contentTextStyle: TextStyle(color: Colors.black),
  ),
);

const List<Color> noteTagColors = [
  Color(0xFF6C63FF),
  Color(0xFFFFC107),
  Color(0xFF4CAF50),
  Color(0xFFFF7043),
  Color(0xFF42A5F5),
  Color(0xFFE91E63),
];
