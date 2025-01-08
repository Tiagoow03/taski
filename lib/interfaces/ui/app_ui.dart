import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/handler/app_handler.dart';
import 'package:taski/interfaces/ui/widgets/app_bar.dart';
import 'package:taski/interfaces/ui/widgets/nav_bar/nav_bar.dart';

class AppUI extends StatefulWidget {
  const AppUI({super.key});

  @override
  State<AppUI> createState() => _AppUIState();
}

class _AppUIState extends State<AppUI> {
  final AppUIHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  Widget build(BuildContext context) {
    _handler.appStore.setContext(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: RouterOutlet(),
      bottomNavigationBar: Observer(
        builder: (context) {
          return MyNavBar(
            onNavigate: (screen) {
              Modular.to.navigate(screen);
              _handler.appStore.setCurrentScreen(screen);
            },
            onCreate: () => _handler.appStore.openCreateDropdown(
              () {},
            ),
            currentScreen: _handler.appStore.currentScreen,
          );
        },
      ),
    );
  }
}
