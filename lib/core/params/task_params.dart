import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';

class TaskParams {
  final int? id;
  final String title;
  final int isCompleted;

  TaskParams({
    this.id,
    required this.title,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      TasksDBKeys.taskId: id,
      TasksDBKeys.taskTitle: title,
      TasksDBKeys.taskCompleted: isCompleted,
    };
  }
}
