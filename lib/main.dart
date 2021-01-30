import 'package:flutter/material.dart';
//screens
import 'Views/Screens/TodayHomePage.dart';

void main() => runApp(ToDoActivity());

class ToDoActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      routes: {
        '/TodayHomePage': (context) => TodayHomePage(),
      },
      home: TodayHomePage(),
    );
  }
}
