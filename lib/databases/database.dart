import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo_flutter/databases/dao/task_dao.dart';
import 'package:todo_flutter/databases/dao/task_type_dao.dart';
import 'package:todo_flutter/databases/domain/task.dart';
import 'package:todo_flutter/databases/domain/task_type.dart';

part 'database.g.dart';

@UseMoor(tables: [Tasks, TaskTypes], daos: [TaskDao, TaskTypeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;



}
