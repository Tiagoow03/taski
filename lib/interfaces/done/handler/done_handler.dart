import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';

class DoneHandler {
  final AppStore _appStore;

  DoneHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  AppStore get appStore => _appStore;

  void deleteTask(int id) async {
    await _taskUseCase.removeTask(id);
  }

  void deleteTaskCompleted() async {
    await _taskUseCase.removeTaskCompleted();
  }
}
