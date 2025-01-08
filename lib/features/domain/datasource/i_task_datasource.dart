import 'package:sqflite/sqflite.dart';
import 'package:taski/features/domain/entities/task.dart';

abstract interface class ITaskDatasource {
  Future<bool> checkDatabaseExists(String dbName);

  Future<Database> initDatabase(String dbName);

  Future<Database> connectDatabase(String dbName);

  Future<void> closeDatabase(Database database);

  Future<int> createTask(Task task);

  Future<List<Task>> getAllTasks();

  Future<int> updateTask(Task task);

  Future<int> deleteTask(int id);
}
