import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/todo/handler/todo_handler.dart';
import 'package:taski/interfaces/todo/widgets/card_task_widget.dart';
import 'package:taski/interfaces/todo/widgets/empty_task_widget.dart';
import 'package:taski/utils/constants.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoHandler _handler = Modular.get();

  @override
  void initState() {
    if (mounted) super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: kPaddingDefault,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: kPaddingDefault / 3,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'John',
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.tertiary),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  'You’ve got ${_handler.appStore.tasks.length} tasks to do.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (_handler.appStore.tasks.isEmpty)
                  EmptyTaskWidget(
                    onCreateTask: () => _handler.appStore.openCreateDropdown(_createTask),
                  )
                else
                  ListView.builder(
                    itemCount: _handler.appStore.tasks.length,
                    itemBuilder: (context, index) {
                      return CardTaskWidget(
                        isDone: _handler.appStore.tasks[index].isDone,
                        title: _handler.appStore.tasks[index].title,
                        description: _handler.appStore.tasks[index].description,
                        isFirst: index == 0,
                        isLast: index == _handler.appStore.tasks.length - 1,
                      );
                    },
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.0),
                          Colors.white.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _createTask() async {
    try {
      await _handler.createTask();
    } finally {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
