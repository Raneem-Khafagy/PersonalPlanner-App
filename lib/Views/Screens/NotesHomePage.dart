import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:myplanner/Views/Widgets/BackgroundDecoration.dart';
import 'package:myplanner/Views/Widgets/CircularTodayDate.dart';
import 'package:myplanner/Views/Widgets/Header.dart';
import 'package:myplanner/Views/Widgets/NotesHomePage/AddNewNote.dart';

import 'package:provider/provider.dart';

class NotesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<NoteProvider>(context, listen: false).notesWidgetsList();
    List<Widget> cards =
        Provider.of<NoteProvider>(context, listen: false).noteCards;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Header(
                AddWidget: Container(
                  width: width * .12,
                  child: AddNewNoteButton(
                    typeofAdd: 'new note',
                    iconofAdd: (CupertinoIcons.square_pencil),
                  ),
                ),
              ),
              BackgroundDecoration(),
            ],
          ),
          CircularTodayDate(),
          Positioned(
            top: height * .16,
            height: height * 0.76,
            width: width,
            child: Container(
                height: height * 0.7,
                width: width,
                child: ListView(
                  children: cards,
                )),
          ),
        ],
      ),
    );
  }
}

// Positioned(
//   top: height * .16,
//   height: height * 0.76,
//   width: width,
//   child: Container(
//     height: height * 0.7,
//     width: width,
//     child: ListView(
//       children: [
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss sssss  ssss ssss ssssss ssssss ssssss sssssss ssssss ssssss ssssss dddddd",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//         NoteWidget(
//           noteDescription:
//               "ddddddd dssss ddmd ddd ddd ddd ddd ddd ddd ddd ddd dd dd ddddd dddd dddd dddd ",
//           noteTitle: "xxxxxxxxxxxx",
//           noteDate: 'ascasc',
//         ),
//       ],
//     ),
//   ),
// ),
