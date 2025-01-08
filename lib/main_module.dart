import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/core/database/database_provider.dart';
import 'package:taski/domain/datasource/i_task_datasource.dart';
import 'package:taski/domain/repository/i_task_repository.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';
import 'package:taski/features/done/presenter/page/done_page.dart';
import 'package:taski/interfaces/ui/handler/app_handler.dart';
import 'package:taski/interfaces/ui/app_ui.dart';
import 'package:taski/infra/datasource/task_datasource.dart';
import 'package:taski/infra/repository/task_repository.dart';
import 'package:taski/infra/usecase/task_usecase.dart';
import 'package:taski/features/search/presenter/page/search_page.dart';
import 'package:taski/features/todo/presenter/handler/todo_handler.dart';
import 'package:taski/features/todo/presenter/store/todo_store.dart';
import 'package:taski/features/todo/presenter/todo_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(AppStore.new);
    i.addLazySingleton(TodoStore.new);

    i.addLazySingleton(AppUIHandler.new);
    i.addLazySingleton(TodoHandler.new);

    i.addLazySingleton<DatabaseProvider>(DatabaseProvider.new);
    i.addLazySingleton<ITaskUseCase>(TaskUseCase.new);
    i.addLazySingleton<ITaskRepository>(TaskRepository.new);
    i.addLazySingleton<ITaskDatasource>(TaskDatasource.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 0),
      child: (context) => AppUI(),
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
