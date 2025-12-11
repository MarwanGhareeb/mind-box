import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_todo_app_mind_box/core/params/task_params.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/core/utils/enums/feature_enum.dart';
import 'package:note_todo_app_mind_box/core/widgets/custom_delete_button.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/bloc/tasks_bloc.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});

  final TaskEntity task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> with TickerProviderStateMixin {
  late final ValueNotifier<bool> _checkBoxNotifier;

  late final AnimationController _sizeController;
  late final AnimationController _slideController;
  late final Animation<double> _animationSize;
  late final Animation<Offset> _animationSlide;

  @override
  void initState() {
    _checkBoxNotifier =
        ValueNotifier<bool>(widget.task.isCompleted == 1 ? true : false);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animationSize =
        Tween<double>(begin: 1, end: -0.7).animate(_sizeController);
    _animationSlide = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(_slideController);

    super.initState();
  }

  @override
  void dispose() {
    _checkBoxNotifier.dispose();
    _sizeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animationSize,
      child: SlideTransition(
        position: _animationSlide,
        child: Container(
          padding: EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 15),
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: AppColors.whiteWithAlpha(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.whiteWithAlpha(0.3),
            ),
          ),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: _checkBoxNotifier,
                builder: (context, value, child) {
                  return MSHCheckbox(
                    value: value,
                    duration: Duration(milliseconds: 600),
                    onChanged: _onCheckBoxChanged,
                    size: 25,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: AppColors.accentGreen,
                      uncheckedColor: AppColors.accentBlue,
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.task.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 5),
              CustomDeleteButton(
                onPressed: _onDelete,
                feature: Feature.tasks,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCheckBoxChanged(bool? value) {
    _checkBoxNotifier.value = value!;
    context.read<TasksBloc>().add(
          UpdateTasksEvent(
            params: TaskParams(
              id: widget.task.id,
              title: widget.task.title,
              isCompleted: _checkBoxNotifier.value ? 1 : 0,
            ),
          ),
        );
  }

  void _onDelete() async {
    await _slideController.forward();
    await _sizeController.forward();

    if (!mounted) return;

    context.read<TasksBloc>().add(
          DeleteTasksEvent(id: widget.task.id),
        );
  }
}
