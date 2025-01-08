import 'package:flutter/material.dart';
import 'package:taski/interfaces/ui/widgets/nav_bar/item_bar.dart';

class MyNavBar extends StatelessWidget {
  final void Function(String screen) onNavigate;
  final VoidCallback onCreate;
  final String currentScreen;

  const MyNavBar({
    super.key,
    required this.onNavigate,
    required this.onCreate,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 2,
          ),
        ),
      ),
      child: BottomAppBar(
        child: Row(
          children: [
            ItemNavigationBar(
              onTap: () => onNavigate('/todo'),
              currentScreen: currentScreen,
              screenItem: '/todo',
              icon: 'assets/images/icon_todo.svg',
              label: 'Todo',
            ),
            ItemNavigationBar(
              onTap: onCreate,
              currentScreen: currentScreen,
              screenItem: 'create',
              icon: 'assets/images/icon_plus.svg',
              label: 'Create',
            ),
            ItemNavigationBar(
              onTap: () => onNavigate('/search'),
              currentScreen: currentScreen,
              screenItem: '/search',
              icon: 'assets/images/icon_search.svg',
              label: 'Search',
            ),
            ItemNavigationBar(
              onTap: () => onNavigate('/done'),
              currentScreen: currentScreen,
              screenItem: '/done',
              icon: 'assets/images/icon_checked.svg',
              label: 'Done',
            ),
          ],
        ),
      ),
    );
  }
}