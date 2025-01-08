import 'package:sqflite/sqflite.dart';
import 'package:taski/features/domain/entities/task.dart';

abstract interface class ITaskRepository {
  Future<Database> initializeDatabase(String dbName);

  Future<void> closeDatabase(Database database);

  Future<void> addTask(Task task);

  Future<List<Task>> fetchTasks();

  Future<void> editTask(Task task);

  Future<void> removeTask(int id);
}
