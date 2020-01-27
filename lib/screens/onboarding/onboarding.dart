import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter/databases/dao/task_type_dao.dart';
import 'package:todo_flutter/databases/database.dart';
import 'package:todo_flutter/screens/onboarding/page_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: new Image.asset('images/onboarding.png')),
          Center(
            child: Text(
              'Todo Manager',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff554E8F)),
            ),
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    'To a great mind, nothing is little.',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff82A0B7)),
                    textAlign: TextAlign.center,
                  ))),
          Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF5DE61A),
                        Color(0xFF39A801),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF66C81C),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                  onPressed: () async {
                    insertDataTaskType(context);

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('seen', true);
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (context) => new PageScreen()));
                  },
                  textColor: Colors.white,
                  child: Text('Get Started',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Open Sans',
                      )),
                )),
          )
        ],
      ),
    );
  }
}

void insertDataTaskType(context) {
  final dao = Provider.of<TaskTypeDao>(context);

  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Personal'),
      image: moor.Value('images/personalTaskType.png'),
      colorCode: moor.Value(0XFFFFD506)));
  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Work'),
      image: moor.Value('images/workTaskType.png'),
      colorCode: moor.Value(0XFF5DE61A)));
  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Meeting'),
      image: moor.Value('images/meetingTaskType.png'),
      colorCode: moor.Value(0XFFD10263)));
  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Shopping'),
      image: moor.Value('images/shoppingTaskType.png'),
      colorCode: moor.Value(0XFFF29130)));
  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Party'),
      image: moor.Value('images/partyTaskType.png'),
      colorCode: moor.Value(0XFF09ACCE)));
  dao.insertTaskType(TaskTypesCompanion(
      name: moor.Value('Study'),
      image: moor.Value('images/studyTaskType.png'),
      colorCode: moor.Value(0XFF3044F2)));
}
