import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      return await _pref.setString(key, value);
    } else if (value is int) {
      return await _pref.setInt(key, value);
    } else if (value is bool) {
      return await _pref.setBool(key, value);
    } else if (value is double) {
      return await _pref.setDouble(key, value);
    } else if (value is List<String>) {
      return await _pref.setStringList(key, value);
    } else {
      throw CacheException("Unknown DataType Error From Cache");
    }
  }

  Object? getData({required String key}) {
    return _pref.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await _pref.remove(key);
  }

  Future<bool> clearData() async {
    return await _pref.clear();
  }

  Future<bool> containsKey({required String key}) async {
    return _pref.containsKey(key);
  }
}
