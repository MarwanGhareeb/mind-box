import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:note_todo_app_mind_box/core/cache/cache_helper.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final CacheHelper _cacheHelper;
  final String key = "isDarkMode";

  ThemeNotifier(this._cacheHelper) : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() {
    state = _cacheHelper.getData(key: key) as bool
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    state = isDark ? ThemeMode.dark : ThemeMode.light;

    await _cacheHelper.saveData(key: key, value: isDark);
  }
}

final StateNotifierProvider<ThemeNotifier, ThemeMode> themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(CacheHelper()),
);
