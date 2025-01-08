import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';
import 'package:taski/features/todo/presenter/store/todo_store.dart';

class TodoHandler {
  final AppStore _appStore;

  TodoHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  final TodoStore _store = Modular.get();

  TodoStore get store => _store;

  AppStore get appStore => _appStore;

  Future<void> initialize() async {
    var tasks = await _taskUseCase.getTasks();
    _store.setTasks(tasks);
  }

  Future<void> createTask() async {
    try {
      await _taskUseCase.insertTask(
        Task(
          title: _appStore.titleController.text,
          description: _appStore.descriptionController.text,
          date: DateTime.now().toIso8601String(),
          isDone: false,
        ),
      );
    } finally {
      _appStore.titleController.clear();
      _appStore.descriptionController.clear();
      _store.setTasks(await _taskUseCase.getTasks());
    }
  }

  void dispose() => _store.dispose();
}
