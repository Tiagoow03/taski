import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
