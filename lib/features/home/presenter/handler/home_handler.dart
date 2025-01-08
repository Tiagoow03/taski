import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taski/core/app_store/app_store.dart';
import 'package:taski/features/domain/entities/task.dart';
import 'package:taski/features/domain/usecase/i_task_usecase.dart';

class HomeHandler {
  final AppStore _appStore;

  HomeHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  AppStore get appStore => _appStore;

  Database? _database;

  Future<void> initialize() async {
    _database = await _taskUseCase.connectDatabase('taski.db');

    await _taskUseCase.insertTask(
      Task(
        title: 'Estudar Flutter',
        description: 'Estudar Flutter para melhorar minhas habilidades',
        date: DateTime.now().toIso8601String(),
        isDone: false,
      ),
    );
  }

  void dispose() {
    if (_database != null) {
      _taskUseCase.closeDatabase(_database!);
    }
  }
}
