import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/themes/app_gradients.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';
import 'package:note_todo_app_mind_box/core/widgets/loading_skelton_list.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/widgets/tasks_view.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping anywhere on the screen
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.scaffoldBackgroundGradient,
        ),
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(top: 30),
                  sliver: SliverToBoxAdapter(
                    child: const MindBoxWidget(),
                  ),
                ),
                if (state is TasksLoadingState)
                  SliverPadding(
                    padding: EdgeInsetsGeometry.only(top: 50),
                    sliver: const LoadingSkeletonList(feature: Feature.tasks),
                  )
                else if (state is TasksErrorState)
                  SliverPadding(
                    padding: EdgeInsetsGeometry.all(5),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                else if (state is TasksLoadedState)
                  SliverPadding(
                    padding: const EdgeInsetsGeometry.all(0),
                    sliver: SliverToBoxAdapter(
                      child: TasksView(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
