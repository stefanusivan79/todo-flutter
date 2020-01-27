import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_flutter/databases/database.dart';

class TaskDto {
  final Task task;
  final TaskType taskType;

  TaskDto({
    @required this.task,
    @required this.taskType
  });
}
