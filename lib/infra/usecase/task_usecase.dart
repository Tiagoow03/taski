import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print('Erro ao conectar ao banco de dados!\n Erro: $e');
      }
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
      tasks = await _repository.getTasks();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar tarefas!\n Erro: $e');
      }
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
      if (kDebugMode) {
        print('Erro ao criar tarefa!\n Erro: $e');
      }
    } finally {
      _appStore.titleController.clear();
      _appStore.descriptionController.clear();
      onConclude();

      await getTasks();
    }
  }

  @override
  Future<void> markAsDone(Task task) async {
    try {
      await _repository.markAsDone(task);
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao marcar tarefa como concluída!\n Erro: $e');
      }
    } finally {
      await getTasks();
    }
  }

  @override
  Future<void> editTask(Task task) async {
    return await _repository.editTask(task);
  }

  @override
  Future<void> removeTask(int id) async {
    try {
      await _repository.removeTask(id);
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao deletar tarefa!\n Erro: $e');
      }
    } finally {
      await getTasks();
    }
  }

  @override
  Future<void> removeTaskCompleted() async {
    try {
      await _repository.removeTaskCompleted();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao deletar tarefas concluídas!\n Erro: $e');
      }
    } finally {
      await getTasks();
    }
  }
}
