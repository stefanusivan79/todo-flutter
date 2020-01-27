import 'package:moor/moor.dart';
import 'package:todo_flutter/databases/database.dart';
import 'package:todo_flutter/databases/domain/task.dart';
import 'package:todo_flutter/databases/domain/task_type.dart';
import 'package:todo_flutter/dto/tasks_dto.dart';

part 'task_dao.g.dart';

@UseDao(tables: [Tasks, TaskTypes])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();

  Stream<List<Task>> watchAllTasks() {
    return (select(tasks)
          ..orderBy(
            ([
              (t) =>
                  OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name)
            ]),
          ))
        .watch();
  }

  Stream<List<TaskDto>> watchAllTaskDto() {
    /*return (
      select(tasks)
        ..orderBy(
          ([
                (t) =>
                OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
                (t) => OrderingTerm(expression: t.name)
          ]),
        )

    ).watch();*/

    return (select(tasks)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              (t) =>
                  OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.name)
            ]),
          ))
        // As opposed to orderBy or where, join returns a value. This is what we want to watch/get.
        .join(
          [
            // Join all the tasks with their tags.
            // It's important that we use equalsExp and not just equals.
            // This way, we can join using all tag names in the tasks table, not just a specific one.
            leftOuterJoin(
                taskTypes, taskTypes.name.equalsExp(tasks.taskTypeName)),
          ],
        )
        // watch the whole select statement including the join
        .watch()
        // Watching a join gets us a Stream of List<TypedResult>
        // Mapping each List<TypedResult> emitted by the Stream to a List<TaskWithTag>
        .map((rows) => rows.map(
              (rows) {
                return TaskDto(
                  task: rows.readTable(tasks),
                  taskType: rows.readTable(taskTypes),
                );
              },
            ).toList());
  }

  Future<List<Task>> getTaskByTaskType(String taskType) =>
      (select(tasks)..where((t) => t.taskTypeName.equals(taskType))).get();

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);

  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);

  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);

  Stream<int> countTaskByType(String type) {
    return (select(tasks)..where((t) => t.taskTypeName.equals(type)))
        .watch()
        .asyncMap((t) => t.length);
  }
}
