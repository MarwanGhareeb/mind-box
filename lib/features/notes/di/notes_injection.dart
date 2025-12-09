import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/core/databases/local/database_consumer.dart';
import 'package:note_todo_app_mind_box/features/notes/data/data_sources/notes_local_data_source.dart';
import 'package:note_todo_app_mind_box/features/notes/data/repositories/notes_repo_impl.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/repositories/notes_repo.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/add_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/update_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';

void initNotesDependencies(GetIt getIt) {
  getIt.registerLazySingleton<NotesLocalDataSource>(
    () => NotesLocalDataSource(getIt<DatabaseConsumer>()),
  );

  getIt.registerLazySingleton<NotesRepo>(
    () => NotesRepoImpl(getIt<NotesLocalDataSource>()),
  );

  getIt.registerLazySingleton<GetNotesUseCase>(
    () => GetNotesUseCase(getIt<NotesRepo>()),
  );
  getIt.registerLazySingleton<AddNoteUseCase>(
    () => AddNoteUseCase(getIt<NotesRepo>()),
  );
  getIt.registerLazySingleton<UpdateNoteUseCase>(
    () => UpdateNoteUseCase(getIt<NotesRepo>()),
  );
  getIt.registerLazySingleton<DeleteNoteUseCase>(
    () => DeleteNoteUseCase(getIt<NotesRepo>()),
  );

  getIt.registerFactory<NotesBloc>(
    () => NotesBloc(
      getIt<GetNotesUseCase>(),
      getIt<AddNoteUseCase>(),
      getIt<UpdateNoteUseCase>(),
      getIt<DeleteNoteUseCase>(),
    ),
  );
}
