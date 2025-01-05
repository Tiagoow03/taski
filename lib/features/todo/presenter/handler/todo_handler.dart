import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/todo/domain/entities/task.dart';
import 'package:taski/features/todo/presenter/store/todo_store.dart';

class TodoHandler {
  TodoHandler();

  final TodoStore _store = Modular.get();

  TodoStore get store => _store;

  Future<void> initialize() async {
    // _store.addTask(
    //   Task(
    //     id: 1,
    //     date: '04/09/2021 14:35',
    //     title: 'Design sign up flow',
    //     description: 'By the time a prospect arrives at your signup page, in most cases, they’ve already By the time '
    //         'a prospect arrives at your signup page, in most cases.',
    //     isDone: false,
    //   ),
    // );
    // _store.addTask(
    //   Task(id: 2, date: '04/09/2021 14:35', title: 'Design use case page', description: '', isDone: false),
    // );
    // _store.addTask(
    //   Task(id: 3, date: '04/09/2021 14:35', title: 'Test Wireframe', description: '', isDone: false),
    // );
    // _store.addTask(
    //   Task(id: 4, date: '04/09/2021 14:35', title: 'Create new task UI flow', description: '', isDone: false),
    // );
    // _store.addTask(
    //   Task(id: 5, date: '04/09/2021 14:35', title: 'Collect project assets', description: '', isDone: false),
    // );
    // _store.addTask(
    //   Task(id: 5, date: '04/09/2021 14:35', title: 'Collect Skills list', description: '', isDone: false),
    // );
    // _store.addTask(
    //   Task(
    //     id: 5,
    //     date: '04/09/2021 14:35',
    //     title: 'Collect icons',
    //     description: 'By the time a prospect arrives at your signup page, in most cases, they’ve already By the time '
    //         'a prospect arrives at your signup page, in most cases.',
    //     isDone: false,
    //   ),
    // );
  }

  void dispose() => _store.dispose();
}
