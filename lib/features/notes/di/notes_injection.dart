import 'package:get_it/get_it.dart';
import 'package:note_todo_app_mind_box/features/notes/data/repositories/notes_repo_impl.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/add_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/update_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';

Future<void> initNotesFeature(GetIt getIt) async {
  getIt.registerLazySingleton(() => GetNotesUseCase(getIt<NotesRepoImpl>()));
  getIt.registerLazySingleton(() => AddNoteUseCase(getIt<NotesRepoImpl>()));
  getIt.registerLazySingleton(() => UpdateNoteUseCase(getIt<NotesRepoImpl>()));
  getIt.registerLazySingleton(() => DeleteNoteUseCase(getIt<NotesRepoImpl>()));

  getIt.registerFactory(
    () => NotesBloc(
      getIt<GetNotesUseCase>(),
      getIt<AddNoteUseCase>(),
      getIt<UpdateNoteUseCase>(),
      getIt<DeleteNoteUseCase>(),
    ),
  );
}
