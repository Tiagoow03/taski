import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:taski/features/home/presenter/widgets/create_dropdown.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  BuildContext? _context;

  @action
  void setContext(BuildContext context) => _context = context;

  @action
  void openCreateDropdown() {
    if (_context == null) return;
    showModalBottomSheet(
      context: _context!,
      isDismissible: true,
      barrierColor: Colors.transparent,
      builder: (_) => const CreateDropdown(),
    );
  }
}
