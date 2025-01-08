import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/entities/task.dart';

abstract interface class ITaskUseCase {
  Future<Database> connectDatabase(String dbName);

  Future<void> closeDatabase(Database database);

  Future<List<Task>> getTasks();

  Future<void> insertTask(Task task);

  Future<void> editTask(Task task);

  Future<void> removeTask(int id);
}