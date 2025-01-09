import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';

class SearchHandler {
  final AppStore _appStore;

  SearchHandler(this._appStore);

  final ITaskUseCase _taskUseCase = Modular.get();

  AppStore get appStore => _appStore;

  void tapDoneOrUndone(Task task) async {
    await _taskUseCase.markAsDone(
      Task(
        id: task.id,
        title: task.title,
        description: task.description,
        date: task.date,
        dateCompleted: task.isDone ? null : DateTime.now().toIso8601String(),
        isDone: !task.isDone,
      ),
    );
  }
}
