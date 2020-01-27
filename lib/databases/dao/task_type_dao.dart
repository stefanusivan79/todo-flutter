import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_flutter/databases/database.dart';
import 'package:todo_flutter/databases/domain/task_type.dart';

part 'task_type_dao.g.dart';

@UseDao(tables: [TaskTypes])
class TaskTypeDao extends DatabaseAccessor<AppDatabase> with _$TaskTypeDaoMixin {

  final AppDatabase db;

  TaskTypeDao(this.db) : super(db);

  Stream<List<TaskType>> watchAllTaskType() => select(taskTypes).watch();

  Future<List<TaskType>> getAllTaskType() => select(taskTypes).get();

  Future insertTaskType(Insertable<TaskType> taskType) => into(taskTypes).insert(taskType);
}