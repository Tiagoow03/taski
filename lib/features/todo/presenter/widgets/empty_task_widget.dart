import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({
    super.key,
    required this.onCreateTask,
  });

  final void Function() onCreateTask;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: kPaddingDefault,
        children: [
          SvgPicture.asset('assets/images/list_empty.svg', height: 100),
          Text(
            'You have no task listed.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primaryFixed,
            ),
          ),
          ElevatedButton(
            onPressed: onCreateTask,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.1),
              surfaceTintColor: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.1),
              shadowColor: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.1),
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingDefault,
                vertical: kPaddingDefault / 1.5,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  size: 24,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: kPaddingDefault / 3),
                Text(
                  'Create task',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
