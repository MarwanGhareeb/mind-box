import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/cache/cache_helper.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/notes_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MindBoxTheme.lightTheme,
      home: const NotesScreen(),
    );
  }
}
