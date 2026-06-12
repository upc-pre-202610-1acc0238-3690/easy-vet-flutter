import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database as Database;
    _database = await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    String databaseName = 'app_database.db';
    String path = join(await getDatabasesPath(), databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT,
            price REAL,
            image TEXT
          )
        ''');
      },
    );
  }
}
