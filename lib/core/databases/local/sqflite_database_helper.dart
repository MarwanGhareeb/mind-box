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
    final String path = join(dbPath, 'database-name.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    '''
      create your tables here
    ''';
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
