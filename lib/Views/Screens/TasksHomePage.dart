import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:myplanner/Views/Widgets/BackgroundDecoration.dart';
import 'package:myplanner/Views/Widgets/CircularTodayDate.dart';
import 'package:myplanner/Views/Widgets/Header.dart';

import 'package:myplanner/Views/Widgets/TasksHomePage/AddNewTask.dart';

import 'package:provider/provider.dart';

class TasksHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Header(
                AddWidget: Container(
                  width: width * .12,
                  child: AddNewTaskButton(
                    typeofAdd: 'new task',
                    iconofAdd: (CupertinoIcons.list_bullet),
                  ),
                ),
              ),
              BackgroundDecoration(),
            ],
          ),
          CircularTodayDate(),
          Positioned(
            top: height * .23,
            height: height * 0.5,
            width: width,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: width * .2,
                    child: AddNewTaskButton(
                      typeofAdd: 'new task',
                      iconofAdd: (CupertinoIcons.list_bullet),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
