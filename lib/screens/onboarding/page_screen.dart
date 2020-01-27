import 'package:flutter/material.dart';
import 'package:todo_flutter/form/add_task.dart';
import 'package:todo_flutter/screens/home/home_screen.dart';
import 'package:todo_flutter/screens/task/task_screen.dart';

class PageScreen extends StatefulWidget {
  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  int _currentIndex = 0;
  final List<Widget> _listScreens = [
    HomeScreen(),
    TaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTitleAppBar(_currentIndex),
        ),
      ),
      body: _listScreens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _addTaskModal(context),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: getBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      }, // new
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text("Task"),
        ),
      ],
      currentIndex: _currentIndex, // new
    );
  }

  String getTitleAppBar(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Tasks';
      default:
        return 'Home';
    }
  }

  void _addTaskModal(context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return AddTaskForm();
        });
  }
}
