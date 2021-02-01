import 'package:flutter/material.dart';
import 'package:myplanner/Views/Screens/AddNewNote.dart';
import 'package:myplanner/Widgets/AddNew/Note.dart';
import 'package:myplanner/Widgets/TodayHomePage/CircularTodayDate.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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

              SizedBox(
                height: 16,
              ),
              NewWidget(),

              Note(),
              //AddNewNoteTextField(),
            ],
          ),
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      icon: Icons.add,
      text: 'Add new note',
      color: Theme.of(context).primaryColor,
      pressEvent: () {
        AwesomeDialog dialog;
        dialog = AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          //dialogType: DialogType.INFO,
          keyboardAware: true,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'new note',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    autofocus: true,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Title',
                      prefixIcon: Icon(Icons.text_fields),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.multiline,
                    maxLengthEnforced: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Description',
                      prefixIcon: Icon(Icons.text_fields),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                    text: 'Close',
                    pressEvent: () {
                      dialog.dissmiss();
                    }),
              ],
            ),
          ),
        )..show();
      },
    );
  }
}

//  border:
//               Border.all(color: widget.color ?? Theme.of(context).primaryColor),
