import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/core/app_store/app_store.dart';
import 'package:taski/features/domain/usecase/i_task_usecase.dart';
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

  void dispose() => _store.dispose();
}
