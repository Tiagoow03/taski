import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
  BuildContext? _context;

  @action
  void setContext(BuildContext context) => _context = context;

  @action
  void openCreateDropdown(VoidCallback onCreated) {
    if (_context == null) return;
    showModalBottomSheet(
      context: _context!,
      isDismissible: true,
      barrierColor: Colors.transparent,
      builder: (_) => CreateDropdown(
        titleController: titleController,
        descriptionController: descriptionController,
        onCreated: onCreated,
      ),
    );
  }
}