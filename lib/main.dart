import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          primaryContainer: Color(0xFFF5F7F9),
          inversePrimary: Color(0xFFC6CFDC),
          primaryFixed: Color(0xFF8D9CB8),
          secondary: Color(0xFF3F3D56),
          tertiary: Color(0xFF007FFF),
        ),
        fontFamily: GoogleFonts.urbanist().fontFamily,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFF3F3D56),
              displayColor: Color(0xFF3F3D56),
              fontFamily: GoogleFonts.urbanist().fontFamily,
            ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
            ),
            const Spacer(),
            Text(
              'John',
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: kPaddingDefault,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kPaddingDefault, top: kPaddingDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: kPaddingDefault / 3,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'John',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  'You’ve got 7 tasks to do.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault / 2),
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
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kPaddingDefault / 2),
                                  border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                  ),
                                ),
                              ),
                              SizedBox(width: kPaddingDefault),
                              Text(
                                'Design sign up flow',
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 25 + kPaddingDefault),
                              Expanded(
                                child: Text(
                                  'By the time a prospect arrives at your signup page, in most cases, they’ve already '
                                  'By the time a prospect arrives at your signup page, in most cases.',
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
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.0),
                          Colors.white.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 2)),
        ),
        child: BottomAppBar(
          child: Row(
            children: [
              ItemNavigationBar(
                onTap: () {},
                currentItemBar: 0,
                numberItem: 0,
                icon: 'assets/images/icon_todo.svg',
                label: 'Todo',
              ),
              ItemNavigationBar(
                onTap: () {},
                currentItemBar: 0,
                numberItem: 1,
                icon: 'assets/images/icon_plus.svg',
                label: 'Create',
              ),
              ItemNavigationBar(
                onTap: () {},
                currentItemBar: 0,
                numberItem: 2,
                icon: 'assets/images/icon_search.svg',
                label: 'Search',
              ),
              ItemNavigationBar(
                onTap: () {},
                currentItemBar: 0,
                numberItem: 3,
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
  final int currentItemBar;
  final int numberItem;
  final String icon;
  final String label;

  const ItemNavigationBar({
    super.key,
    required this.onTap,
    required this.currentItemBar,
    required this.numberItem,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  currentItemBar == numberItem
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.inversePrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: currentItemBar == numberItem
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
