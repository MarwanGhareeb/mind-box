import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/notes_screen.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/screens/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexSelector = 1;
  final List<Widget> _pages = [
    const NotesScreen(),
    const TasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexSelector],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
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
