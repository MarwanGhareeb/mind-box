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

// import 'package:flutter/material.dart';

// class MindBoxTheme {
//   /// 🎨 خلفية التطبيق (Gradient)
//   static const LinearGradient backgroundGradient = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFF312E81), // indigo-900
//       Color(0xFF581C87), // purple-900
//       Color(0xFF831843), // pink-800
//     ],
//   );

//   /// 🌟 الثيم الأساسي للتطبيق (Light Theme)
//   static final ThemeData lightTheme = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: Colors.transparent,

//     // ✅ ألوان أساسية
//     colorScheme: const ColorScheme.light(
//       primary: Color(0xFF8B5CF6), // purple-500
//       secondary: Color(0xFFEC4899), // pink-500
//       surface: Colors.transparent,
//     ),

//     // 📝 نصوص
//     textTheme: const TextTheme(
//       headlineLarge: TextStyle(
//         color: Colors.white,
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//       ),
//       titleLarge: TextStyle(
//         color: Color(0xFFE9D5FF), // purple-200
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//       ),
//       bodyLarge: TextStyle(
//         color: Color(0xFFECECEC), // شبه أبيض
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//       ),
//       bodyMedium: TextStyle(
//         color: Color(0xFFD8B4FE), // purple-300
//         fontSize: 14,
//       ),
//     ),

//     // 🔘 الأزرار العائمة
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(0xFFF59E0B), // amber-400
//       foregroundColor: Colors.white,
//       elevation: 10,
//       shape: CircleBorder(),
//     ),

//     // ✨ التأثيرات والظلال
//     cardTheme: CardTheme(
//       color: Colors.white.withValues(alpha: 0.1),
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),

//     iconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//   );

//   /// 🗒️ ألوان الملاحظات
//   static const Map<String, List<Color>> noteColors = {
//     'yellow': [
//       Color(0xFFFBBF24), // فاتح
//       Color(0xFFF59E0B), // متوسط
//       Color(0xFFF97316), // غامق
//     ],
//     'blue': [
//       Color(0xFF60A5FA), // فاتح
//       Color(0xFF22D3EE), // متوسط
//       Color(0xFF14B8A6), // غامق
//     ],
//     'pink': [
//       Color(0xFFF472B6), // فاتح
//       Color(0xFFFB7185), // متوسط
//       Color(0xFFF87171), // غامق
//     ],
//     'green': [
//       Color(0xFF4ADE80), // فاتح
//       Color(0xFF34D399), // متوسط
//       Color(0xFF14B8A6), // غامق
//     ],
//     'purple': [
//       Color(0xFFA78BFA), // فاتح
//       Color(0xFF8B5CF6), // متوسط
//       Color(0xFF6366F1), // غامق
//     ],
//     'orange': [
//       Color(0xFFFB923C), // فاتح
//       Color(0xFFF87171), // متوسط
//       Color(0xFFF472B6), // غامق
//     ],
//   };

//   /// 💎 تأثير الزجاج (Glass Effect)
//   static BoxDecoration glassEffect = BoxDecoration(
//     color: Colors.white.withValues(alpha: 0.1),
//     border: Border.all(
//       color: Colors.white.withValues(alpha: 0.2),
//     ),
//     borderRadius: BorderRadius.circular(20),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withValues(alpha: 0.2),
//         blurRadius: 10,
//         spreadRadius: 1,
//       ),
//     ],
//     backgroundBlendMode: BlendMode.overlay,
//   );

//   /// 🟡 ألوان الأزرار العائمة (FAB)
//   static const Map<String, LinearGradient> fabGradients = {
//     'notes': LinearGradient(
//       colors: [Color(0xFFFBBF24), Color(0xFFF97316)],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//     'tasks': LinearGradient(
//       colors: [Color(0xFF60A5FA), Color(0xFF6366F1)],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     ),
//   };

//   /// ⚙️ ألوان الحالات (Status)
//   static const Map<String, Color> statusColors = {
//     'completed': Color(0xFF10B981),
//     'pending': Color(0xFF6366F1),
//     'delete': Color(0xFFEF4444),
//   };
// }
