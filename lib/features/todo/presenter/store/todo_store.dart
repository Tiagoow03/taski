import 'package:mobx/mobx.dart';
import 'package:taski/features/domain/entities/task.dart';

part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @action
  void setTasks(List<Task> value) => tasks = value.asObservable();

  @action
  void addTask(Task task) => tasks.add(task);

  @action
  void dispose() {
    setIsLoading(false);
    setTasks([]);
  }
}
