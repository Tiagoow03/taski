import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/todo/presenter/store/todo_store.dart';

class TodoHandler {
  TodoHandler();

  final TodoStore _store = Modular.get();

  TodoStore get store => _store;

  Future<void> initialize() async {}

  void dispose() => _store.dispose();
}
