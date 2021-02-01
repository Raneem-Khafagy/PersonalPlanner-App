import 'package:flutter/material.dart';
import 'package:myplanner/Views/Screens/AddNewNote.dart';
import 'package:myplanner/Widgets/AddNew/Note.dart';
import 'package:myplanner/Widgets/TodayHomePage/CircularTodayDate.dart';

import '../../TRIAL.dart';

class HomePageBodyContent extends StatelessWidget {
  final headLineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: height * .3,
          width: width,
          height: height * .7,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              //AddNewNoteTextField(),
              AddNewWidgetButton(
                typeofAdd: 'new note',
              ),
              SizedBox(
                height: 16,
              ),

              Note(),
              //AddNewNoteTextField(),
            ],
          ),
        ),
      ],
    );
  }
}
