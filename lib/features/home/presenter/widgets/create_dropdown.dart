import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class CreateDropdown extends StatefulWidget {
  const CreateDropdown({super.key});

  @override
  State<CreateDropdown> createState() => _CreateDropdownState();
}

class _CreateDropdownState extends State<CreateDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            spacing: kPaddingDefault,
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/images/icon_pencil.svg',
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.inversePrimary, BlendMode.srcIn),
                ),
              ),
              Expanded(
                child: TextFormField(
                  cursorColor: Theme.of(context).colorScheme.inversePrimary,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  surfaceTintColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kPaddingDefault / 3)),
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
    );
  }
}
