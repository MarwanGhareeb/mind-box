import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_todo_app_mind_box/app/home_screen.dart';
import 'package:note_todo_app_mind_box/app/providers/theme_provider.dart';
import 'package:note_todo_app_mind_box/core/cache/cache_helper.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch<ThemeMode>(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      themeAnimationDuration: const Duration(milliseconds: 300),
      themeAnimationCurve: Easing.standardAccelerate,
      home: const HomeScreen(),
    );
  }
}
