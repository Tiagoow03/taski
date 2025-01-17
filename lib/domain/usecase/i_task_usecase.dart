import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/entities/task.dart';

abstract interface class ITaskUseCase {
  Future<Database> connectDatabase(String dbName);

  Future<void> closeDatabase(Database database);

  Future<List<Task>> getTasks();

  Future<void> insertTask({required Task task, required VoidCallback onConclude});

  Future<void> markAsDone(Task task);

  Future<void> editTask({required Task task, required VoidCallback onConclude});

  Future<void> removeTask(int id);

  Future<void> removeTaskCompleted();
}