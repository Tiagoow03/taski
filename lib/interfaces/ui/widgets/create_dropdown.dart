import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class CreateDropdown extends StatelessWidget {
  const CreateDropdown({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onCreated,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onCreated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.all(kPaddingDefault * 2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(kPaddingDefault * 1.5),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.inversePrimary,
              blurRadius: 24,
              spreadRadius: 5,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: kPaddingDefault / 2,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: kPaddingDefault,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPaddingDefault / 2),
                    border: Border.all(width: 2, color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: titleController,
                    cursorColor: Theme.of(context).colorScheme.inversePrimary,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'What\'s in your mind?',
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: kPaddingDefault,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.only(top: kPaddingDefault / 2),
                  child: SvgPicture.asset(
                    'assets/images/icon_pencil.svg',
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.inversePrimary, BlendMode.srcIn),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: descriptionController,
                    cursorColor: Theme.of(context).colorScheme.inversePrimary,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Add a note...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onCreated,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    surfaceTintColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.tertiary,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kPaddingDefault / 3),
                    ),
                  ),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
