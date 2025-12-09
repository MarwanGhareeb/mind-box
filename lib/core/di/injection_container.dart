import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_consumer.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_database_helper.dart';
import 'package:note_todo_app_mind_box/features/notes/di/notes_injection.dart';
import 'package:note_todo_app_mind_box/features/tasks/di/tasks_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => SqfliteDatabaseHelper.instance);

  final sqfliteConsumer =
      await SqfliteConsumer.create(getIt<SqfliteDatabaseHelper>());

  getIt.registerSingleton<DatabaseConsumer>(sqfliteConsumer);

  initNotesDependencies(getIt);
  initTasksDependencies(getIt);
}
