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

  void initialize() async {}

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

  void tapDoneOrUndone(Task task) async {
    await _taskUseCase.markAsDone(
      Task(
        id: task.id,
        title: task.title,
        description: task.description,
        date: task.date,
        isDone: !task.isDone,
      ),
    );
  }

  void dispose() => _store.dispose();
}
