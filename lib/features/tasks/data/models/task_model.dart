import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/features/tasks/domain/entities/task_entity.dart';

class TaskModel {
  final int id;
  final String title;
  final int isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json[TasksDBKeys.taskId],
        title: json[TasksDBKeys.taskTitle],
        isCompleted: json[TasksDBKeys.taskCompleted],
      );

  TaskEntity toEntity() =>
      TaskEntity(id: id, title: title, isCompleted: isCompleted);

  Map<String, dynamic> toJson() => {
        TasksDBKeys.taskId: id,
        TasksDBKeys.taskTitle: title,
        TasksDBKeys.taskCompleted: isCompleted,
      };
}
