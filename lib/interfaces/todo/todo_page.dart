import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/components/empty_task_widget.dart';
import 'package:taski/interfaces/components/card_task_widget.dart';
import 'package:taski/interfaces/components/shadow_list_widget.dart';
import 'package:taski/interfaces/ui/handler/app_handler.dart';
import 'package:taski/utils/constants.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final AppUIHandler _handler = Modular.get();

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
              padding: const EdgeInsets.only(top: kPaddingDefault, left: kPaddingDefault, right: kPaddingDefault),
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
                    'You’ve got ${_handler.appStore.tasks.where((task) => !task.isDone).length} tasks to do.',
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
                  if (_handler.appStore.tasks.where((task) => !task.isDone).isEmpty)
                    EmptyTaskWidget(
                      description: 'You have no task listed.',
                      onCreateTask: () => _handler.appStore.openCreateDropdown(
                        () => _handler.createTask(
                          onConclude: () => Navigator.of(_handler.appStore.uiContext!).pop(),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: _handler.appStore.tasks.where((task) => !task.isDone).length,
                      itemBuilder: (context, index) {
                        final filteredTasks = _handler.appStore.tasks.where((task) => !task.isDone).toList();

                        filteredTasks.sort((a, b) {
                          DateTime dateA = DateTime.parse(a.date);
                          DateTime dateB = DateTime.parse(b.date);
                          return dateB.compareTo(dateA);
                        });

                        return CardTaskWidget(
                          isDone: filteredTasks[index].isDone,
                          title: filteredTasks[index].title,
                          description: filteredTasks[index].description,
                          isFirst: index == 0,
                          isLast: index == filteredTasks.length - 1,
                          onTapCard: () => _handler.openDropDownEdit(filteredTasks[index]),
                          onTapDone: () => _handler.tapDoneOrUndone(filteredTasks[index]),
                        );
                      },
                    ),
                  ShadowListWidget(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
