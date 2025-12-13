import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/app/glass_bottom_navigation.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/notes_screen.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/screens/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              final page =
                  index == 0 ? const NotesScreen() : const TasksScreen();

              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 0.0;

                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page! - index);
                  }

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0025)
                      ..rotateY(value),
                    child: child,
                  );
                },
                child: page,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: GlassBottomNavigation(
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
              ),
            ),
          )
        ],
      ),
    );
  }
}
