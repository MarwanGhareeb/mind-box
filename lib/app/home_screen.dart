import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/di/injection_container.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexSelector = 0;
  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => getIt<NotesBloc>()..add(GetNotesEvent()),
      child: const NotesScreen(),
    ),
    const Center(child: Text('Tasks Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexSelector],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes,
            ),
            label: "notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
            ),
            label: "tasks",
          ),
        ],
        currentIndex: _indexSelector,
        onTap: (value) {
          setState(() {
            _indexSelector = value;
          });
        },
      ),
    );
  }
}
