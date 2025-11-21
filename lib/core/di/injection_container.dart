import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_consumer.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_database_helper.dart';
import 'package:note_todo_app_mind_box/features/notes/data/repositories/notes_repo_impl.dart';
import 'package:note_todo_app_mind_box/features/notes/di/notes_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => SqfliteDatabaseHelper.instance);

  final SqfliteConsumer sqfliteConsumer =
      await SqfliteConsumer.create(getIt<SqfliteDatabaseHelper>());

  getIt.registerLazySingleton(() => NotesRepoImpl(sqfliteConsumer));

  await initNotesFeature(getIt);
}
