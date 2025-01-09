import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Future<Database> provideDatabase(String dbName) async {
    final path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE task (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT NOT NULL,
            dateCompleted TEXT,
            isDone INTEGER NOT NULL,
            title TEXT NOT NULL,
            description TEXT
          )
        ''');
      },
    );
  }
}
