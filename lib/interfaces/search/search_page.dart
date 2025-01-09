import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingDefault),
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: kPaddingDefault),
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.tertiary,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primaryFixed,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingDefault / 1),
                  child: SvgPicture.asset(
                    'assets/images/icon_search.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.tertiary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingDefault / 1.1),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/icon_x.svg',
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.inversePrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                hoverColor: Theme.of(context).colorScheme.secondary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                  borderRadius: BorderRadius.circular(kPaddingDefault),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                  borderRadius: BorderRadius.circular(kPaddingDefault),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
