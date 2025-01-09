import 'package:mobx/mobx.dart';
import 'package:taski/domain/entities/task.dart';

part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void dispose() {
    setIsLoading(false);
  }
}
