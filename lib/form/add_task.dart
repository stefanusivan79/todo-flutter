import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:provider/provider.dart';
import 'package:todo_flutter/components/date_picker.dart';
import 'package:todo_flutter/databases/dao/task_dao.dart';
import 'package:todo_flutter/databases/dao/task_type_dao.dart';
import 'package:todo_flutter/databases/database.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();

  final noteController = TextEditingController();
  final dueDateController = TextEditingController();

  int _taskTypeIndex = 0;
  String _taskTypeValue;

  DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<TaskTypeDao>(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 40),
                  _noteField(),
                  SizedBox(height: 24.0),
                  _taskTypeField(dao),
                  SizedBox(height: 24.0),
                  DatePicker(
                    labelText: 'Due Date',
                    selectedDate: _dueDate,
                    selectDate: (DateTime date) {
                      setState(() {
                        _dueDate = date;
                      });
                    },
                  ),
                  SizedBox(height: 24.0),
                  _buttonSubmit(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  void dispose() {
    noteController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  void _taskSubmit(BuildContext context) {
    final FormState form = _formKey.currentState;

    final taskDao = Provider.of<TaskDao>(context);

    if (form.validate()) {
      form.save();
      final tasksCompanion = TasksCompanion(
          name: moor.Value(noteController.text),
          dueDate: moor.Value(_dueDate),
          taskTypeName: moor.Value(_taskTypeValue));
      taskDao.insertTask(tasksCompanion);
      Navigator.of(context).pop();
    }
  }

  Widget _buttonSubmit() {
    return Container(
        decoration: _decorationButtonSubmit(),
        child: FlatButton(
          onPressed: () {
            _taskSubmit(context);
          },
          textColor: Colors.white,
          child: Text('Get Started',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans',
              )),
        ));
  }

  Decoration _decorationButtonSubmit() {
    return BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF7EB6FF),
            Color(0xFF5F87E7),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Color(0x6894EE), blurRadius: 5, spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(5));
  }

  Widget _noteField() {
    return TextFormField(
        maxLength: 50,
        textCapitalization: TextCapitalization.sentences,
        controller: noteController,
        decoration: InputDecoration(
          hintText: 'Note',
        ),
        validator: (value) {
          return (value.isEmpty) ? 'Please enter some text' : null;
        },
        onSaved: (text) {});
  }

  Widget _taskTypeField(TaskTypeDao taskTypeDao) {
    return Container(
      height: 50,
      child: StreamBuilder(
        stream: taskTypeDao.watchAllTaskType(),
        builder: (context, snapshot) {
          final List<TaskType> taskTypeList = snapshot.data ?? List();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: taskTypeList.length,
            itemBuilder: (context, index) {
              final TaskType taskType = taskTypeList[index];
              if (_taskTypeIndex == index) _taskTypeValue = taskType.name;
              return _choiceChipTaskType(index, taskType);
            },
          );
        },
      ),
    );
  }

  ChoiceChip _choiceChipTaskType(int index, TaskType taskType) {
    return ChoiceChip(
      avatar: _taskTypeIndex != index
          ? CircleAvatar(
              maxRadius: 5,
              backgroundColor: Color(taskType.colorCode),
            )
          : null,
      label: Text(taskType.name),
      selected: _taskTypeIndex == index,
      selectedColor: Color(taskType.colorCode),
      onSelected: (bool value) {
        setState(() {
          if (value && _taskTypeIndex != index) _taskTypeIndex = index;
        });
      },
      backgroundColor: Colors.transparent,
      labelStyle: _taskTypeIndex == index
          ? TextStyle(color: Colors.white)
          : TextStyle(color: Colors.black),
    );
  }
}
