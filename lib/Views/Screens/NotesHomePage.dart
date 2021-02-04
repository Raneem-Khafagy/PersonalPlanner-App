import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Provider/Providers.dart';
import 'package:myplanner/Views/Widgets/BackgroundDecoration.dart';
import 'package:myplanner/Views/Widgets/BottomNavigationBar.dart';
import 'package:myplanner/Views/Widgets/CircularTodayDate.dart';
import 'package:myplanner/Views/Widgets/Header.dart';
import 'package:myplanner/Views/Widgets/NotesHomePage/AddNewNote.dart';
import 'package:myplanner/Views/Widgets/TasksHomePage/AddNewTask.dart';

import 'package:provider/provider.dart';

class NotesHomePage extends StatelessWidget {
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
              Header(),
              BackgroundDecoration(),
            ],
          ),
          CircularTodayDate(),
          Positioned(
            top: height * .23,
            height: height * .77,
            width: width,
            child: Center(
                child: Column(
              children: [
                Container(
                  width: width * .4,
                  child: AddNewNoteButton(
                    typeofAdd: 'new note',
                    iconofAdd: (CupertinoIcons.square_pencil),
                  ),
                ),
                // FutureBuilder(
                //   future: Provider.of<NoteProvider>(context, listen: false)
                //       .notesWidgetsList(),
                //   initialData: false,
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //     print("display ");
                //     if (snapshot.hasData == true) {
                //       print(snapshot.data);
                //       return ListView(
                //         children: snapshot.data,
                //       );
                //     } else {
                //       print("data not");
                //       return Container();
                //     }
                //   },
                // ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
