import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/todo/presenter/handler/todo_handler.dart';
import 'package:taski/features/todo/presenter/widgets/card_task_widget.dart';
import 'package:taski/features/todo/presenter/widgets/empty_task_widget.dart';
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
    return Observer(
      builder: (context) {
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
                    'You’ve got ${_handler.store.tasks.length} tasks to do.',
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
                  if (_handler.store.tasks.isEmpty)
                    EmptyTaskWidget(
                      onCreateTask: () => _handler.appStore.openCreateDropdown(),
                    )
                  else
                    ListView.builder(
                      itemCount: _handler.store.tasks.length,
                      itemBuilder: (context, index) {
                        return CardTaskWidget(
                          isDone: _handler.store.tasks[index].isDone,
                          title: _handler.store.tasks[index].title,
                          description: _handler.store.tasks[index].description,
                          isFirst: index == 0,
                          isLast: index == _handler.store.tasks.length - 1,
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
      }
    );
  }
}
