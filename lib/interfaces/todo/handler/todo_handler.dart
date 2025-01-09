import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';
import 'package:taski/interfaces/todo/store/todo_store.dart';

class TodoHandler {
  final AppStore _appStore;

  TodoHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  final TodoStore _store = Modular.get();

  TodoStore get store => _store;

  AppStore get appStore => _appStore;

  Future<void> initialize() async {}

  Future<void> createTask() async {
    await _taskUseCase.insertTask(
      task: Task(
        title: _appStore.titleController.text,
        description: _appStore.descriptionController.text,
        date: DateTime.now().toIso8601String(),
        isDone: false,
      ),
      onConclude: () {},
    );
  }

  void dispose() => _store.dispose();
}
