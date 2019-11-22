import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;

  DBHelper._createInstance();

  factory DBHelper() {
    if (_dbHelper == null) return _dbHelper = DBHelper._createInstance();
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'local_database.db'),
      version: 1,
      onCreate: _createDatabase,
    );

    return db;
  }

  _createDatabase(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');
  }
}
