import 'package:path/path.dart';
import 'package:taski/core/database/database_provider.dart';
import 'package:taski/domain/datasource/i_task_datasource.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatasource implements ITaskDatasource {
  final DatabaseProvider _databaseProvider;

  TaskDatasource(this._databaseProvider);

  Future<Database> _getDatabase(String dbName) async {
    return await _databaseProvider.provideDatabase(dbName);
  }

  @override
  Future<bool> checkDatabaseExists(String dbName) async {
    final path = join(await getDatabasesPath(), dbName);
    return await databaseFactory.databaseExists(path);
  }

  @override
  Future<Database> initDatabase(String dbName) async {
    return await _getDatabase(dbName);
  }

  @override
  Future<Database> connectDatabase(String dbName) async {
    return await _getDatabase(dbName);
  }

  @override
  Future<void> closeDatabase(Database database) async {
    await database.close();
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final db = await _getDatabase('taski.db');
    final result = await db.query('task');
    return result.map((map) => Task.fromMap(map)).toList();
  }

  @override
  Future<int> createTask(Task task) async {
    final db = await _getDatabase('taski.db');
    return await db.insert('task', task.toMap());
  }

  @override
  Future<int> markAsDone(Task task) async {
    final db = await _getDatabase('taski.db');
    return await db.update(
      'task',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<int> updateTask(Task task) async {
    final db = await _getDatabase('taski.db');
    return await db.update(
      'task',
      {'title': task.title, 'description': task.description},
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<int> deleteTask(int id) async {
    final db = await _getDatabase('taski.db');
    return await db.delete('task', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteTaskCompleted() async {
    final db = await _getDatabase('taski.db');
    return await db.delete('task', where: 'isDone = ?', whereArgs: [1]);
  }
}
