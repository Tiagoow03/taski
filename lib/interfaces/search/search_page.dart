import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/interfaces/components/empty_task_widget.dart';
import 'package:taski/interfaces/search/handler/search_handler.dart';
import 'package:taski/interfaces/components/card_task_widget.dart';
import 'package:taski/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchHandler _handler = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final searchQuery = _handler.appStore.searchQuery.toLowerCase();

        final filteredTasks = _handler.appStore.tasks.where((task) {
          return task.title.toLowerCase().contains(searchQuery) || task.description.toLowerCase().contains(searchQuery);
        }).toList();

        filteredTasks.sort((a, b) {
          DateTime dateA = DateTime.parse(a.date);
          DateTime dateB = DateTime.parse(b.date);
          return dateB.compareTo(dateA);
        });

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            spacing: kPaddingDefault,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: kPaddingDefault, left: kPaddingDefault, right: kPaddingDefault),
                child: TextFormField(
                  controller: _handler.appStore.searchController,
                  cursorColor: Theme.of(context).colorScheme.tertiary,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) => _handler.appStore.searchQuery = value,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primaryFixed,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: kPaddingDefault / 1),
                      child: SvgPicture.asset(
                        'assets/images/icon_search.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.tertiary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    suffixIcon: _handler.appStore.searchController.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: kPaddingDefault / 1.1),
                            child: GestureDetector(
                              onTap: () {
                                _handler.appStore.searchController.clear();
                                _handler.appStore.setSearchQuery('');
                              },
                              child: SvgPicture.asset(
                                'assets/images/icon_x.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          )
                        : null,
                    hoverColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                      borderRadius: BorderRadius.circular(kPaddingDefault),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                      borderRadius: BorderRadius.circular(kPaddingDefault),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    filteredTasks.isEmpty && searchQuery.isNotEmpty
                        ? EmptyTaskWidget(
                            description: 'No result found.',
                          )
                        : filteredTasks.isEmpty
                            ? EmptyTaskWidget(
                                description: 'All your created tasks will appear here.',
                                onCreateTask: () => _handler.appStore.openCreateDropdown(
                                  () => _handler.createTask(
                                    onConclude: () => Navigator.of(_handler.appStore.uiContext!).pop(),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: filteredTasks.length,
                                itemBuilder: (context, index) {
                                  return CardTaskWidget(
                                    isDone: filteredTasks[index].isDone,
                                    title: filteredTasks[index].title,
                                    description: filteredTasks[index].description,
                                    isFirst: index == 0,
                                    isLast: index == filteredTasks.length - 1,
                                    onTapDone: () => _handler.tapDoneOrUndone(filteredTasks[index]),
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
          ),
        );
      },
    );
  }
}
