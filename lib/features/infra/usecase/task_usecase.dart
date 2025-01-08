import 'package:sqflite/sqflite.dart';
import 'package:taski/features/domain/entities/task.dart';
import 'package:taski/features/domain/repository/i_task_repository.dart';
import 'package:taski/features/domain/usecase/i_task_usecase.dart';

class TaskUseCase implements ITaskUseCase {
  final ITaskRepository _repository;

  TaskUseCase(this._repository);

  @override
  Future<Database> connectDatabase(String dbName) async {
    return await _repository.initializeDatabase(dbName);
  }

  @override
  Future<void> closeDatabase(Database database) async {
    return await _repository.closeDatabase(database);
  }

  @override
  Future<List<Task>> getTasks() async {
    return await _repository.fetchTasks();
  }

  @override
  Future<void> insertTask(Task task) async {
    return await _repository.addTask(task);
  }

  @override
  Future<void> editTask(Task task) async {
    return await _repository.editTask(task);
  }

  @override
  Future<void> removeTask(int id) async {
    return await _repository.removeTask(id);
  }
}
