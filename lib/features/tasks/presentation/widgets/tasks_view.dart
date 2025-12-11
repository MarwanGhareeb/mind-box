import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/task_params.dart';
import 'package:note_todo_app_mind_box/core/widgets/custom_text_field.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/enums/task_status_enum.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/widgets/status_tab.dart';
import 'package:note_todo_app_mind_box/features/tasks/presentation/widgets/task_card.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _controller;
  late final ValueNotifier<TaskStatus> _taskStatusNotifier;
  late final ValueNotifier<List<TaskEntity>> _filteredTasksNotifier;

  @override
  void initState() {
    _controller = TextEditingController();
    _taskStatusNotifier = ValueNotifier(TaskStatus.all);
    _filteredTasksNotifier = ValueNotifier([]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _taskStatusNotifier.dispose();
    _filteredTasksNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TasksBloc, TasksState, List<TaskEntity>>(
      selector: (state) {
        if (state is TasksLoadedState) return state.tasks;
        return [];
      },
      builder: (context, tasks) {
        _applyFilter(tasks);

        return Column(
          children: [
            SizedBox(height: 20),
            _addTaskWidget(),
            SizedBox(height: 10),
            _statusTabs(tasks: tasks),
            SizedBox(height: 10),
            _tasksList(),
          ],
        );
      },
    );
  }

  void _applyFilter(List<TaskEntity> tasks) {
    switch (_taskStatusNotifier.value) {
      case TaskStatus.pending:
        _filteredTasksNotifier.value =
            tasks.where((task) => task.isCompleted == 0).toList();
        break;

      case TaskStatus.completed:
        _filteredTasksNotifier.value =
            tasks.where((task) => task.isCompleted == 1).toList();
        break;

      default:
        _filteredTasksNotifier.value = tasks;
        break;
    }
  }

  Padding _addTaskWidget() {
    void onPressed() {
      if (_formKey.currentState!.validate()) {
        context.read<TasksBloc>().add(
              AddTasksEvent(
                params: TaskParams(
                  title: _controller.text,
                  isCompleted: 0,
                ),
              ),
            );
        _controller.clear();
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: CustomTextField(
                hintText: "Write Task here...",
                controller: _controller,
                keyboardType: TextInputType.name,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton.outlined(
            onPressed: onPressed,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _statusTabs({required List<TaskEntity> tasks}) {
    return ValueListenableBuilder(
      valueListenable: _taskStatusNotifier,
      builder: (context, status, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                StatusTab(
                  title: "All",
                  count: tasks.length,
                  icon: Icons.list,
                  isActive: status == TaskStatus.all,
                  onTap: () {
                    _taskStatusNotifier.value = TaskStatus.all;
                    _applyFilter(tasks);
                  },
                ),
                const SizedBox(width: 20),
                StatusTab(
                  title: "Pending",
                  count: tasks.where((t) => t.isCompleted == 0).length,
                  icon: Icons.hourglass_bottom,
                  isActive: status == TaskStatus.pending,
                  onTap: () {
                    _taskStatusNotifier.value = TaskStatus.pending;
                    _applyFilter(tasks);
                  },
                ),
                const SizedBox(width: 20),
                StatusTab(
                  title: "Completed",
                  count: tasks.where((t) => t.isCompleted == 1).length,
                  icon: Icons.check_circle,
                  isActive: status == TaskStatus.completed,
                  onTap: () {
                    _taskStatusNotifier.value = TaskStatus.completed;
                    _applyFilter(tasks);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tasksList() {
    return ValueListenableBuilder(
      valueListenable: _filteredTasksNotifier,
      builder: (context, filtered, _) {
        return Column(
          children: List.generate(
            filtered.length,
            (i) {
              return TaskCard(
                key: ValueKey(filtered[i].id),
                task: filtered[i],
              );
            },
          ),
        );
      },
    );
  }
}
