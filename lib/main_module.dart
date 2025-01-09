import 'package:flutter_modular/flutter_modular.dart';
import 'package:taski/interfaces/done/handler/done_handler.dart';
import 'package:taski/interfaces/ui/store/app_store.dart';
import 'package:taski/core/database/database_provider.dart';
import 'package:taski/domain/datasource/i_task_datasource.dart';
import 'package:taski/domain/repository/i_task_repository.dart';
import 'package:taski/domain/usecase/i_task_usecase.dart';
import 'package:taski/interfaces/done/done_page.dart';
import 'package:taski/interfaces/ui/handler/app_handler.dart';
import 'package:taski/interfaces/ui/app_ui.dart';
import 'package:taski/infra/datasource/task_datasource.dart';
import 'package:taski/infra/repository/task_repository.dart';
import 'package:taski/infra/usecase/task_usecase.dart';
import 'package:taski/interfaces/search/search_page.dart';
import 'package:taski/interfaces/todo/handler/todo_handler.dart';
import 'package:taski/interfaces/todo/todo_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(AppStore.new);

    i.addLazySingleton(AppUIHandler.new);
    i.addLazySingleton(TodoHandler.new);
    i.addLazySingleton(DoneHandler.new);

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
