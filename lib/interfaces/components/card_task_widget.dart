import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class CardTaskWidget extends StatelessWidget {
  const CardTaskWidget({
    super.key,
    required this.isDone,
    required this.title,
    required this.description,
    required this.isFirst,
    required this.isLast,
    this.isScreenDone = false,
    required this.onTapCard,
    required this.onTapDone,
    this.onTapDelete,
  });

  final bool isDone;
  final String title;
  final String description;
  final bool isFirst;
  final bool isLast;
  final bool isScreenDone;
  final VoidCallback onTapCard;
  final VoidCallback onTapDone;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      behavior: HitTestBehavior.opaque,
      child: Container(
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
              spacing: kPaddingDefault,
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isScreenDone
                              ? Theme.of(context).colorScheme.primaryFixed
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: isScreenDone ? onTapDelete : () {},
                        child: SvgPicture.asset(
                          'assets/images/${isScreenDone ? 'icon_trash' : 'icon_dots'}.svg',
                          height: isScreenDone ? 18 : null,
                          width: isScreenDone ? null : 20,
                          colorFilter: ColorFilter.mode(
                            isScreenDone
                                ? Theme.of(context).colorScheme.error
                                : description != ''
                                    ? Colors.transparent
                                    : Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
