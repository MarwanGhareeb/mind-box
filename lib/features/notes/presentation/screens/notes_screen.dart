import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/themes/app_gradients.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';
import 'package:note_todo_app_mind_box/core/widgets/mind_box_widget.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/screens/add_note_screen.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/utils/transition_route.dart';
import 'package:note_todo_app_mind_box/core/widgets/loading_skelton_list.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/notes_view_animated.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.scaffoldBackgroundGradient,
        ),
        child: BlocBuilder<NotesBloc, NotesState>(
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
                if (state is NotesLoading)
                  SliverPadding(
                    padding: EdgeInsetsGeometry.all(0),
                    sliver: const LoadingSkeletonList(feature: Feature.notes),
                  )
                else if (state is NotesError)
                  SliverPadding(
                    padding: EdgeInsetsGeometry.all(0),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                else if (state is NotesLoaded)
                  SliverPadding(
                    padding: const EdgeInsetsGeometry.all(0),
                    sliver: SliverToBoxAdapter(
                      child: NotesViewAnimated(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Padding _floatingActionButton(BuildContext context) {
    void onPressed() async {
      final bloc = context.read<NotesBloc>();

      await Navigator.push(
        context,
        createTransparentRoute(
          BlocProvider.value(
            value: bloc,
            child: AddNoteScreen(),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.accentAmber,
        child: Icon(
          Icons.add,
          size: 27,
        ),
      ),
    );
  }
}
