import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/home/presenter/handler/home_handler.dart';
import 'package:taski/features/home/presenter/widgets/app_bar.dart';
import 'package:taski/features/home/presenter/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeHandler _handler = Modular.get();

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
            onCreate: () => _handler.appStore.openCreateDropdown(),
            currentScreen: _handler.appStore.currentScreen,
          );
        },
      ),
    );
  }
}
