import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_todo_app_mind_box/app/providers/theme_provider.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexSelector = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    const NotesScreen(),
    const Center(child: Text('Tasks Page')),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: _indexSelector);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.bottomRight,
            child: Consumer(
              builder: (context, ref, child) {
                final themeMode = ref.watch(themeProvider);
                final themeNotifier = ref.read(themeProvider.notifier);

                return IconButton(
                  onPressed: () {
                    themeNotifier.toggleTheme(themeMode == ThemeMode.light);
                  },
                  icon: child!,
                );
              },
              child: Icon(Icons.mode_night_outlined),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _indexSelector = value;
              }),
              children: _pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notes,
              ),
              label: "notes"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.task,
              ),
              label: "tasks"),
        ],
        currentIndex: _indexSelector,
        onTap: (value) {
          setState(() {
            _indexSelector = value;
          });

          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 800),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
