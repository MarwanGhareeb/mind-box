import 'package:flutter/material.dart';

class MindBoxTheme {
  // 🎯 الألوان المستخرجة من الصورة
  static const Color purpleDark = Color.fromARGB(255, 31, 11, 68);
  static const Color purpleLight = Color.fromARGB(255, 128, 64, 177);
  static const Color greenCard = Color(0xFF4BE1AB);
  static const Color orange = Color(0xFFFFB703);
  static const Color pink = Color(0xFFF85E9F);
  static const Color violet = Color(0xFFB15EFF);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE0E0E0);
  static const Color deleteColor = Color.fromARGB(255, 251, 114, 96);

  // 🌈 الخلفية المتدرجة الرئيسية
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 137, 77, 182), Color.fromARGB(255, 21, 6, 49)],
  );

  // 🧠 الثيم العام للتطبيق
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: purpleLight,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: purpleLight,
      secondary: greenCard,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textSecondary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: textPrimary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: orange,
      foregroundColor: Colors.white,
      elevation: 100,
    ),
    iconTheme: const IconThemeData(
      color: violet,
      size: 25,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: greenCard,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

// ==================== NOTE & TASK COLORS ====================
// ألوان متنوعة للملاحظات والمهام
  static const List<Color> noteColors = [
    Color(0xFF8B5CF6), // Violet-500 - بنفسجي
    Color(0xFFEC4899), // Pink-500 - وردي
    Color(0xFFF97316), // Orange-500 - برتقالي
    Color(0xFF22C55E), // Green-500 - أخضر
    Color(0xFF06B6D4), // Cyan-500 - سماوي
    Color(0xFF84CC16), // Lime-500 - ليموني
  ];

// ألوان الأولوية للمهام
  static const Map<String, Color> priorityColors = {
    'high': Color(0xFFEF4444), // Red-500 - عالي (أحمر)
    'medium': Color(0xFFF97316), // Orange-500 - متوسط (برتقالي)
    'low': Color(0xFF22C55E), // Green-500 - منخفض (أخضر)
  };

// ألوان الحالة للمهام
  static const Map<String, Color> taskStatusColors = {
    'pending': Color(0xFF6B7280), // Gray-500 - في الانتظار
    'in_progress': Color(0xFF3B82F6), // Blue-500 - قيد التنفيذ
    'completed': Color(0xFF22C55E), // Green-500 - مكتمل
    'cancelled': Color(0xFFEF4444), // Red-500 - ملغي
  };

// ألوان الفئات
  static const Map<String, Color> categoryColors = {
    'work': Color(0xFF6366F1), // Indigo-500 - عمل
    'personal': Color(0xFF8B5CF6), // Violet-500 - شخصي
    'study': Color(0xFF22C55E), // Green-500 - دراسة
    'health': Color(0xFFEF4444), // Red-500 - صحة
    'finance': Color(0xFFEAB308), // Yellow-500 - مالية
    'shopping': Color(0xFFEC4899), // Pink-500 - تسوق
    'travel': Color(0xFF06B6D4), // Cyan-500 - سفر
    'entertainment': Color(0xFFF97316), // Orange-500 - ترفيه
  };
}
