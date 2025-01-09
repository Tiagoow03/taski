import 'package:flutter/material.dart';
import 'package:taski/utils/constants.dart';

class CardTaskWidget extends StatelessWidget {
  const CardTaskWidget({
    super.key,
    required this.isDone,
    required this.title,
    required this.description,
    required this.isFirst,
    required this.isLast,
    required this.onTapDone,
  });

  final bool isDone;
  final String title;
  final String description;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTapDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kPaddingDefault,
        right: kPaddingDefault,
        top: isFirst ? kPaddingDefault / 4 : kPaddingDefault,
        bottom: isLast ? kPaddingDefault * 2 : 0,
      ),
      padding: const EdgeInsets.all(kPaddingDefault),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(kPaddingDefault),
      ),
      child: Column(
        spacing: kPaddingDefault / 3,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTapDone,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPaddingDefault / 2),
                    color: isDone
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primaryContainer,
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  child: isDone
                      ? Icon(
                          Icons.check_rounded,
                          size: 20,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )
                      : null,
                ),
              ),
              SizedBox(width: kPaddingDefault),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          if (description != '')
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 25 + kPaddingDefault),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primaryFixed,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
