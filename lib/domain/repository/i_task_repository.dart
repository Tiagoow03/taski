import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/entities/task.dart';

abstract interface class ITaskRepository {
  Future<Database> initializeDatabase(String dbName);

  Future<void> closeDatabase(Database database);

  Future<List<Task>> getTasks();

  Future<void> addTask(Task task);

  Future<void> markAsDone(Task task);

  Future<void> editTask(Task task);

  Future<void> removeTask(int id);
}
