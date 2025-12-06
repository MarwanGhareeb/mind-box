import 'dart:async';
import 'package:animated_text_kit2/animated_text_kit2.dart';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_shadows.dart';
import 'package:note_todo_app_mind_box/core/themes/app_theme.dart';
import 'package:note_todo_app_mind_box/main.dart';

class MindBoxWidget extends StatefulWidget {
  const MindBoxWidget({super.key});

  @override
  State<MindBoxWidget> createState() => _MindBoxWidgetState();
}

class _MindBoxWidgetState extends State<MindBoxWidget>
    with WidgetsBindingObserver, RouteAware {
  final ValueNotifier<double> _turns = ValueNotifier<double>(0);

  Timer? _timer;

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(
      Duration(milliseconds: 1500),
      (_) {
        if (mounted) {
          _turns.value = _turns.value == 0 ? 1 : 0;
        }
      },
    );
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    (state == AppLifecycleState.resumed) ? _startTimer() : _stopTimer();

    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void didPushNext() {
    _stopTimer();
  }

  @override
  void didPopNext() {
    _startTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    routeObserver.unsubscribe(this);
    _stopTimer();
    _turns.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _mainContainer(
      child: Row(
        children: [
          _rotatingBrain(),
          const SizedBox(width: 30),
          _animatedText(text: "Mind Box"),
        ],
      ),
    );
  }

  Container _mainContainer({required Row child}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.glass25,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.borderMedium,
        ),
      ),
      child: child,
    );
  }

  RepaintBoundary _rotatingBrain() {
    BoxDecoration decorationOfBrainContainer() {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        gradient: AppTheme.brainGradient,
        boxShadow: AppShadows.brainIcon,
      );
    }

    Container brainContainer() {
      return Container(
        width: 60,
        height: 90,
        decoration: decorationOfBrainContainer(),
        child: Center(
          child: Image.asset(
            'assets/images/brain.png',
            width: 30,
            height: 30,
            color: AppColors.textPrimary,
          ),
        ),
      );
    }

    return RepaintBoundary(
      child: ValueListenableBuilder(
        valueListenable: _turns,
        child: brainContainer(),
        builder: (context, value, child) {
          return AnimatedRotation(
            duration: Duration(milliseconds: 1200),
            turns: value,
            curve: Curves.easeInOutCubic,
            child: child,
          );
        },
      ),
    );
  }

  RepaintBoundary _animatedText({required String text}) {
    return RepaintBoundary(
      child: AnimatedTextKit2.SplitCharacters(
        text: text,
        repeat: true,
        textStyle: Theme.of(context).textTheme.headlineLarge,
        characterDelay: const Duration(milliseconds: 50),
        delay: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
