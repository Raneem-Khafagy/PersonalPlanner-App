import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:myplanner/Views/Widgets/BackgroundDecoration.dart';
import 'package:myplanner/Views/Widgets/CircularTodayDate.dart';
import 'package:myplanner/Views/Widgets/Header.dart';
import 'package:myplanner/Views/Widgets/NotesHomePage/AddNewNote.dart';
import 'package:myplanner/Views/Widgets/NotesHomePage/note.dart';

import 'package:provider/provider.dart';

class NotesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<NoteProvider>(context, listen: false).notesWidgetsList();
    Widget cards = Provider.of<NoteProvider>(context, listen: false).noteCards;
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
          // Positioned(
          //   top: height * .23,
          //   height: height * 0.77,
          //   width: width,
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Container(
          //           height: height * 0.07,
          //           width: width * .4,
          //           child: AddNewNoteButton(
          //             typeofAdd: 'new note',
          //             iconofAdd: (CupertinoIcons.square_pencil),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Positioned(
            top: height * .23,
            height: height * 0.77,
            width: width,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * .4,
                    child: AddNewNoteButton(
                      typeofAdd: 'new note',
                      iconofAdd: (CupertinoIcons.square_pencil),
                    ),
                  ),

                  Container(
                    height: height * 0.7,
                    width: width,
                    child: (cards == null)
                        ? cards
                        : Container(
                            height: height * 0.7,
                            width: width,
                          ),
                  ),

                  // Container(
                  //   height: height * 0.7,
                  //   width: width,
                  //   child: ListView(
                  //     children: [
                  //       NoteWidget(
                  //         noteDescription: "ddddddddddddd",
                  //         noteTitle: "xxxxxxxxxxxx",
                  //         noteDate: 'ascasc',
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Container(
                  //   padding: EdgeInsets.all(10.0),
                  //   constraints: BoxConstraints.expand(),
                  //   child: FutureBuilder(
                  //     future: Provider.of<NoteProvider>(context, listen: false)
                  //         .notesWidgetsList(),
                  //     initialData: false,
                  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //       print("display ");
                  //       if (snapshot.hasData == true) {
                  //         print(snapshot.data);
                  //         return Container(
                  //           child: snapshot.data,
                  //         );
                  //       } else {
                  //         print("data not");
                  //         return Container();
                  //       }
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
