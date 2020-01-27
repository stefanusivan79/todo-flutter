import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/screens/notask/no_task.dart';
import 'package:todo_flutter/databases/dao/task_dao.dart';
import 'package:todo_flutter/databases/database.dart';
import 'package:todo_flutter/dto/tasks_dto.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return _displayTaskList(context);
  }

  StreamBuilder<List<TaskDto>> _displayTaskList(BuildContext context) {
    final taskDao = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: taskDao.watchAllTaskDto(),
      builder: (context, snapshot) {
        final taskDtoList = snapshot.data ?? List();

        if (taskDtoList.length == 0) return NoTask();

        final taskGroupByDate = groupBy(taskDtoList,
            (dto) => DateFormat('yyyy-MM-dd').format(dto.task.dueDate));

        return ListView.builder(
          itemCount: taskGroupByDate.length,
          itemBuilder: (context, index) {
            String key = taskGroupByDate.keys.elementAt(index);
            return _buildCardList(key, taskGroupByDate[key], taskDao);
          },
        );
      },
    );
  }

  Widget _buildCardList(String key, List<TaskDto> tasks, TaskDao dao) {
    return Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text(
                  DateFormat('MM/dd/yyyy EEE').format(DateTime.parse(key)),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(15, 15, 0, 10)),
          ),
          Divider(
            height: 0,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemBuilder: (context, index) {
              TaskDto dto = tasks[index];
              return _dismissibleListTileTask(dto, dao);
            },
          ),
        ],
      ),
      margin: EdgeInsets.all(15),
    );
  }

  Dismissible _dismissibleListTileTask(TaskDto dto, TaskDao dao) {
    return Dismissible(
      key: ObjectKey(dto.task.id),
      child: ListTile(
        leading: Image.asset(
          dto.taskType.image,
          width: 35,
        ),
        onTap: () =>
            dao.updateTask(dto.task.copyWith(completed: !dto.task.completed)),
        title: Text(
          dto.task.name,
          style: TextStyle(
              decoration: dto.task.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: dto.task.completed ? Colors.grey : Colors.black),
        ),
      ),
      onDismissed: (direction) {
        Task task = dto.task;
        dao.deleteTask(task);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Item deleted'),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                dao.insertTask(task);
              }),
        ));
      },
    );
  }
}
