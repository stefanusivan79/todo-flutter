import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/databases/dao/task_dao.dart';
import 'package:todo_flutter/databases/dao/task_type_dao.dart';
import 'package:todo_flutter/databases/database.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    final taskTypeDao = Provider.of<TaskTypeDao>(context);
    final taskDao = Provider.of<TaskDao>(context);

    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: taskTypeDao.watchAllTaskType(),
            builder: (context, snapshot) {
              final tasks = snapshot.data ?? List();

              return GridView.builder(
                itemCount: tasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio:
                      (orientation == Orientation.portrait) ? 1.0 : 1.3,
                ),
                itemBuilder: (context, index) {
                  final itemTask = tasks[index];
                  return _buildGridTileList(itemTask, taskDao);
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildGridTileList(TaskType itemTask, TaskDao taskDao) {
    return GridTile(
      child: Image.asset(itemTask.image),
      footer: GridTileBar(
          title: Center(
            child: Text(
              itemTask.name,
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff686868)),
            ),
          ),
          subtitle: StreamBuilder<int>(
            stream: taskDao.countTaskByType(itemTask.name),
            builder: (context, snapshot) {
              final countNumber = snapshot.data ?? 0;

              return Center(
                child: Text(
                  '$countNumber Task',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA1A1A1)),
                ),
              );
            },
          )),
    );
  }
}
