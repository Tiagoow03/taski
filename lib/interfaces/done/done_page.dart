import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/components/empty_task_widget.dart';
import 'package:taski/interfaces/done/handler/done_handler.dart';
import 'package:taski/interfaces/components/card_task_widget.dart';
import 'package:taski/utils/constants.dart';

class DonePage extends StatefulWidget {
  const DonePage({super.key});

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  final DoneHandler _handler = Modular.get();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Completed Tasks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_handler.appStore.tasks.where((task) => task.isDone).isNotEmpty)
                        GestureDetector(
                          onTap: () => _handler.deleteTaskCompleted(),
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            'Delete all',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  if (_handler.appStore.tasks.where((task) => task.isDone).isEmpty)
                    EmptyTaskWidget(
                      description: 'All your completed tasks will appear here.',
                      onCreateTask: () => _handler.appStore.openCreateDropdown(
                        () => _handler.createTask(
                          onConclude: () => Navigator.of(_handler.appStore.uiContext!).pop(),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: _handler.appStore.tasks.where((task) => task.isDone).length,
                      itemBuilder: (context, index) {
                        final filteredTasks = _handler.appStore.tasks.where((task) => task.isDone).toList();

                        filteredTasks.sort((a, b) {
                          DateTime dateA = DateTime.parse(a.dateCompleted ?? DateTime.now().toIso8601String());
                          DateTime dateB = DateTime.parse(b.dateCompleted ?? DateTime.now().toIso8601String());
                          return dateB.compareTo(dateA);
                        });

                        return CardTaskWidget(
                          isDone: filteredTasks[index].isDone,
                          title: filteredTasks[index].title,
                          description: filteredTasks[index].description,
                          isFirst: index == 0,
                          isLast: index == filteredTasks.length - 1,
                          isScreenDone: true,
                          onTapDone: () => _handler.tapDoneOrUndone(filteredTasks[index]),
                          onTapDelete: () => _handler.deleteTask(filteredTasks[index].id!),
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
      },
    );
  }
}
