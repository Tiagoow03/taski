import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/datasource/i_task_datasource.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repository/i_task_repository.dart';

class TaskRepository implements ITaskRepository {
  final ITaskDatasource _datasource;

  TaskRepository(this._datasource);

  @override
  Future<Database> initializeDatabase(String dbName) async {
    final databaseExists = await _datasource.checkDatabaseExists(dbName);
    if (!databaseExists) {
      return await _datasource.initDatabase(dbName);
    }
    return await _datasource.connectDatabase(dbName);
  }

  @override
  Future<void> closeDatabase(Database database) async {
    await _datasource.closeDatabase(database);
  }

  @override
  Future<List<Task>> getTasks() async {
    return await _datasource.getAllTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    await _datasource.createTask(task);
  }

  @override
  Future<void> markAsDone(Task task) async {
    await _datasource.markAsDone(task);
  }

  @override
  Future<void> editTask(Task task) async {
    await _datasource.updateTask(task);
  }

  @override
  Future<void> removeTask(int id) async {
    await _datasource.deleteTask(id);
  }
}
