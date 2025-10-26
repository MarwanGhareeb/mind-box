import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_consumer.dart';
import 'package:note_todo_app_mind_box/core/databases/local/sqflite_database_helper.dart';
import 'package:note_todo_app_mind_box/features/notes/data/repositories/notes_repo_impl.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/add_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/update_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(
    () => SqfliteDatabaseHelper.instance,
  );

  final SqfliteConsumer sqfliteConsumer =
      await SqfliteConsumer.create(getIt<SqfliteDatabaseHelper>());

  getIt.registerLazySingleton(
    () => NotesRepoImpl(sqfliteConsumer),
  );

  getIt.registerLazySingleton(
    () => GetNotesUseCase(getIt<NotesRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => AddNoteUseCase(getIt<NotesRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => UpdateNoteUseCase(getIt<NotesRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => DeleteNoteUseCase(getIt<NotesRepoImpl>()),
  );

  getIt.registerFactory(
    () => NotesBloc(
      getIt<GetNotesUseCase>(),
      getIt<AddNoteUseCase>(),
      getIt<UpdateNoteUseCase>(),
      getIt<DeleteNoteUseCase>(),
    ),
  );
}
