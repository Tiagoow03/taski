import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.primary,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon_taski.svg',
            ),
            const SizedBox(width: kPaddingDefault / 2),
            Text(
              'Taski',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Text(
              'John',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: kPaddingDefault / 2),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Icon(
                Icons.person_rounded,
                color: Theme.of(context).colorScheme.primaryContainer,
                size: 35,
              ),
            ),
          ],
        ),
      ),
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
                onTap: () {},
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

class ItemNavigationBar extends StatelessWidget {
  final void Function() onTap;
  final String currentScreen;
  final String screenItem;
  final String icon;
  final String label;

  const ItemNavigationBar({
    super.key,
    required this.onTap,
    required this.currentScreen,
    required this.screenItem,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  currentScreen == screenItem
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.inversePrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: currentScreen == screenItem
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
