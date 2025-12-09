import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';
import 'package:note_todo_app_mind_box/features/tasks/data/data_source/tasks_local_data_source.dart';
import 'package:note_todo_app_mind_box/features/tasks/data/repositories/tasks_repo_impl.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/repositories/tasks_repo.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/use_cases/get_task_use_case.dart';

void initTasksDependencies(GetIt getIt) {
  getIt.registerLazySingleton<TasksLocalDataSource>(
    () => TasksLocalDataSource(getIt<DatabaseConsumer>()),
  );

  getIt.registerLazySingleton<TasksRepo>(
    () => TasksRepoImpl(getIt<TasksLocalDataSource>()),
  );

  getIt.registerLazySingleton<AddTaskUseCase>(
    () => AddTaskUseCase(getIt<TasksRepo>()),
  );
  getIt.registerLazySingleton<DeleteTaskUseCase>(
    () => DeleteTaskUseCase(getIt<TasksRepo>()),
  );
  getIt.registerLazySingleton<GetTaskUseCase>(
    () => GetTaskUseCase(getIt<TasksRepo>()),
  );
}
