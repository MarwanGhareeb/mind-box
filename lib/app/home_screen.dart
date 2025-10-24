import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
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
        body: Center(
          child: Stack(
            children: [
              PageTransitionSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  );
                },
                child: _pages[_indexSelector],
              ),
              Align(
                alignment:
                    Alignment.bottomCenter, // Aligns to the bottom center
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16.0), // Adjust padding as needed
                  child: FloatingActionButton(
                    onPressed: () {
                      // Action for the middle FAB
                      debugPrint('Middle FAB pressed');
                    },
                    heroTag: 'middleFab', // Unique heroTag
                    child: const Icon(Icons.add),
                  ),
                ),
              ),

              // FAB in the top right
              Positioned(
                top: 16.0, // Adjust top position as needed
                right: 16.0, // Adjust right position as needed
                child: FloatingActionButton(
                  onPressed: () {
                    // Action for the top right FAB
                    debugPrint('Top Right FAB pressed');
                  },
                  heroTag: 'topRightFab', // Unique heroTag
                  mini: true, // Optional: make it a mini FAB
                  child: const Icon(Icons.settings),
                ),
              ),
            ],
          ),
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
          },
        )
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        // floatingActionButton: Consumer(
        //   builder: (context, ref, child) {
        //     final themeMode = ref.watch(themeProvider);
        //     final themeNotifier = ref.read(themeProvider.notifier);

        //     return IconButton(
        //       onPressed: () {
        //         themeNotifier.toggleTheme(themeMode == ThemeMode.light);
        //       },
        //       icon: child!,
        //     );
        //   },
        //   child: Icon(Icons.mode_night_outlined),
        // ),
        );
  }
}
