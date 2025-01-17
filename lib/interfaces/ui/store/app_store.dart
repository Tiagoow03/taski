import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/interfaces/ui/widgets/create_dropdown.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  // navigation

  @observable
  String currentScreen = '/todo';

  @action
  void setCurrentScreen(String screen) => currentScreen = screen;

  // create dropdown

  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  BuildContext? uiContext;

  @action
  void setContext(BuildContext context) => uiContext = context;

  @action
  void openCreateDropdown(VoidCallback onTap, {bool isEdit = false}) {
    if (uiContext == null) return;
    showModalBottomSheet(
      context: uiContext!,
      isDismissible: true,
      barrierColor: Colors.transparent,
      builder: (_) => CreateDropdown(
        titleController: titleController,
        descriptionController: descriptionController,
        isEdit: isEdit,
        onTap: onTap,
      ),
    );
  }

  // task

  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @action
  void setTasks(List<Task> value) => tasks = value.asObservable();

  // search

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  String searchQuery = '';

  @action
  void setSearchQuery(String value) => searchQuery = value;
}
