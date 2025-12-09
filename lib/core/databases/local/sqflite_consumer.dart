import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_database_helper.dart';
import 'package:note_todo_app_mind_box/core/errors/exceptions.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteConsumer implements DatabaseConsumer {
  SqfliteConsumer._();

  Database? _database;

  static Future<SqfliteConsumer> create(
    SqfliteDatabaseHelper databaseHelper,
  ) async {
    final SqfliteConsumer sqfliteConsumer = SqfliteConsumer._();
    sqfliteConsumer._database = await databaseHelper.database;
    return sqfliteConsumer;
  }

  @override
  Future<int> addData(
    String table, {
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _database!.insert(table, data);
    } catch (e) {
      throw LocalDatabaseException("Failed to insert data into database");
    }
  }

  @override
  Future<int> deleteData(String table, {required int id}) async {
    try {
      return await _database!.delete(
        table,
        where: "${NotesDBKeys.noteId} = ?",
        whereArgs: [id],
      );
    } catch (e) {
      throw LocalDatabaseException("Failed to delete data from database");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String table,
      {String? title}) async {
    try {
      if (title != null) {
        return await _database!.query(
          table,
          where: "${NotesDBKeys.noteTitle} LIKE ?",
          whereArgs: ['%$title%'],
        );
      } else {
        return await _database!.query(table);
      }
    } catch (e) {
      throw LocalDatabaseException("Failed to get data from database");
    }
  }

  @override
  Future<int> updateData(
    String table, {
    required Map<String, dynamic> data,
    required int id,
  }) async {
    try {
      return await _database!.update(
        table,
        data,
        where: "${NotesDBKeys.noteId} = ?",
        whereArgs: [id],
      );
    } catch (e) {
      throw LocalDatabaseException("Failed to update data into database");
    }
  }
}
