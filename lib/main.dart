import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/main_module.dart';
import 'package:taski/main_widget.dart';

void main() {
  runApp(
    ModularApp(module: MainModule(), child: const MainWidget()),
  );
}
