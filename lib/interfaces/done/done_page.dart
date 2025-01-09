import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/done/handler/done_handler.dart';
import 'package:taski/interfaces/done/widgets/card_task_done_widget.dart';
import 'package:taski/interfaces/done/widgets/empty_task_done_widget.dart';
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
                      Text(
                        'Delete all',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.error,
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
                    EmptyTaskDoneWidget(
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
                          DateTime dateA = DateTime.parse(a.date);
                          DateTime dateB = DateTime.parse(b.date);
                          return dateB.compareTo(dateA);
                        });

                        return CardTaskDoneWidget(
                          isDone: filteredTasks[index].isDone,
                          title: filteredTasks[index].title,
                          description: filteredTasks[index].description,
                          isFirst: index == 0,
                          isLast: index == filteredTasks.length - 1,
                          onTapDone: () => _handler.tapDoneOrUndone(filteredTasks[index]),
                          onTapDelete: () {},
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
