import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/repository/i_task_repository.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';

class TaskUseCase implements ITaskUseCase {
  final AppStore _appStore;
  final ITaskRepository _repository;

  TaskUseCase(this._appStore, this._repository);

  @override
  Future<Database> connectDatabase(String dbName) async {
    Database? database;

    try {
      database = await _repository.initializeDatabase(dbName);
    } catch (e) {
      print('Erro ao conectar ao banco de dados!\n Erro: $e');
    } finally {
      if (database != null) {
        await getTasks();
      }
    }

    return database!;
  }

  @override
  Future<void> closeDatabase(Database database) async {
    return await _repository.closeDatabase(database);
  }

  @override
  Future<List<Task>> getTasks() async {
    List<Task> tasks = [];

    try {
      tasks = await _repository.fetchTasks();
    } catch (e) {
      print('Erro ao buscar tarefas!\n Erro: $e');
    } finally {
      _appStore.setTasks(tasks);
    }

    return tasks;
  }

  @override
  Future<void> insertTask({
    required Task task,
    required VoidCallback onConclude,
  }) async {
    try {
      await _repository.addTask(task);
    } catch (e) {
      print('Erro ao criar tarefa!\n Erro: $e');
    } finally {
      _appStore.titleController.clear();
      _appStore.descriptionController.clear();
      onConclude();

      await getTasks();
    }
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
