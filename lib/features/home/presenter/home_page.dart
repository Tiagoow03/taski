import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/home/presenter/handler/home_handler.dart';
import 'package:taski/features/home/presenter/widgets/app_bar.dart';
import 'package:taski/features/home/presenter/widgets/item_bar.dart';

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 2),
          ),
        ),
        child: BottomAppBar(
          child: Row(
            children: [
              ItemNavigationBar(
                onTap: () {
                  Modular.to.navigate('/todo');
                  setState(() {});
                },
                currentScreen: Modular.to.navigateHistory.last.name,
                screenItem: '/todo',
                icon: 'assets/images/icon_todo.svg',
                label: 'Todo',
              ),
              ItemNavigationBar(
                onTap: () => _handler.appStore.openCreateDropdown(),
                currentScreen: Modular.to.navigateHistory.last.name,
                screenItem: 'create',
                icon: 'assets/images/icon_plus.svg',
                label: 'Create',
              ),
              ItemNavigationBar(
                onTap: () {
                  Modular.to.navigate('/search');
                  setState(() {});
                },
                currentScreen: Modular.to.navigateHistory.last.name,
                screenItem: '/search',
                icon: 'assets/images/icon_search.svg',
                label: 'Search',
              ),
              ItemNavigationBar(
                onTap: () {
                  Modular.to.navigate('/done');
                  setState(() {});
                },
                currentScreen: Modular.to.navigateHistory.last.name,
                screenItem: '/done',
                icon: 'assets/images/icon_checked.svg',
                label: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
