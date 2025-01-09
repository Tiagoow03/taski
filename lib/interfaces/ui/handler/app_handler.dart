import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';

class AppUIHandler {
  final AppStore _appStore;

  AppUIHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  AppStore get appStore => _appStore;

  Database? _database;

  void initialize() async {
    _database = await _taskUseCase.connectDatabase('taski.db');
  }

  void createTask({required Function() onConclude}) async {
    await _taskUseCase.insertTask(
      task: Task(
        title: _appStore.titleController.text,
        description: _appStore.descriptionController.text,
        date: DateTime.now().toIso8601String(),
        isDone: false,
      ),
      onConclude: onConclude,
    );
  }

  void dispose() {
    if (_database != null) {
      _taskUseCase.closeDatabase(_database!);
    }
  }
}
