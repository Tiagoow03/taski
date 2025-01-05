import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/home/widgets/app_bar.dart';
import 'package:taski/features/home/widgets/create_dropdown.dart';
import 'package:taski/features/home/widgets/item_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: RouterOutlet(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 2)),
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
                onTap: () => showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  barrierColor: Colors.transparent,
                  builder: (_) => const CreateDropdown(),
                ),
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
