import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/features/done/presenter/page/done_page.dart';
import 'package:taski/features/home/home_page.dart';
import 'package:taski/features/search/presenter/page/search_page.dart';
import 'package:taski/features/todo/presenter/page/todo_page.dart';

class MainModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 0),
      child: (context) => HomePage(),
      children: [
        ChildRoute(
          '/todo',
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 0),
          child: (context) => TodoPage(),
        ),
        ChildRoute(
          '/search',
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 0),
          child: (context) => SearchPage(),
        ),
        ChildRoute(
          '/done',
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 0),
          child: (context) => DonePage(),
        ),
      ],
    );
  }
}
