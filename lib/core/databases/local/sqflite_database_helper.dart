import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabaseHelper {
  static final SqfliteDatabaseHelper instance = SqfliteDatabaseHelper._();

  SqfliteDatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'mind-box.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${NotesDBKeys.notesTable} (
        ${NotesDBKeys.notesId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${NotesDBKeys.notesTitle} TEXT,
        ${NotesDBKeys.notesContent} TEXT,
        ${NotesDBKeys.notesColor} INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${TasksDBKeys.tasksTable} (
        ${TasksDBKeys.tasksId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TasksDBKeys.tasksTitle} TEXT,
        ${TasksDBKeys.tasksCompleted} INTEGER DEFAULT 0,
        ${TasksDBKeys.tasksCreatedAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
