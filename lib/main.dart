import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/app/home_screen.dart';
import 'package:note_todo_app_mind_box/core/cache/cache_helper.dart';
import 'package:note_todo_app_mind_box/core/di/injection_container.dart';
import 'package:note_todo_app_mind_box/core/themes/app_theme.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/bloc/tasks_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await initDependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NotesBloc>()..add(GetNotesEvent())),
        BlocProvider(create: (_) => getIt<TasksBloc>()..add(GetTasksEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const HomeScreen(),
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
