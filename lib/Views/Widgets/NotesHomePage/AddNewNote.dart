import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myplanner/Models/NoteData.dart';
import 'package:myplanner/Views/Widgets/TasksHomePage/AddNewTask.dart';
import 'package:provider/provider.dart';

import 'package:myplanner/Controllers/Providers.dart';

class AddNewNoteButton extends StatelessWidget {
  AddNewNoteButton({Key key, this.typeofAdd, this.iconofAdd}) : super(key: key);
  final String typeofAdd;
  final iconofAdd;
  final TextEditingController noteTitle = TextEditingController();
  final TextEditingController noteDiscription = TextEditingController();
  String noteDate =
      DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: AnimatedButton(
        buttonTextStyle:
            TextStyle(color: Theme.of(context).accentColor, fontSize: 14),
        icon: Icons.add,
        // text: 'Add ' + typeofAdd,
        text: '',
        color: Theme.of(context).primaryColor,
        pressEvent: () {
          AwesomeDialog dialog;
          dialog = AwesomeDialog(
            context: context,
            customHeader: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    offset: Offset(0, 1),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  iconofAdd,
                  color: Theme.of(context).accentColor,
                  size: 40,
                ),
              ),
            ),
            animType: AnimType.SCALE,
            //dialogType: DialogType.NO_HEADER,
            keyboardAware: true,
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .03, vertical: height * .007),
              child: Column(
                children: <Widget>[
                  Text(
                    typeofAdd,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 0,
                    color: Colors.blueGrey.withAlpha(40),
                    child: TextFormField(
                      autofocus: true,
                      minLines: 1,
                      controller: noteTitle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Title',
                        prefixIcon: Icon(Icons.text_fields),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Material(
                    elevation: 0,
                    color: Colors.blueGrey.withAlpha(40),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      maxLengthEnforced: true,
                      maxLines: null,
                      controller: noteDiscription,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.text_fields),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      ActionButton(
                        dialog: dialog,
                        eventOnTap: () async {
                          // print(
                          //     "textfield debug: ${noteDiscription.text},${noteTitle.text},${noteDate}");
                          await Provider.of<NoteProvider>(context,
                                  listen: false)
                              .insertNote(
                            Note(
                              noteDescription: noteDiscription.text,
                              noteTitle: noteTitle.text,
                              noteDate: noteDate,
                            ),
                          );

                          await Provider.of<NoteProvider>(context,
                                  listen: false)
                              .notesWidgetsList();
                          noteDiscription.clear();
                          noteTitle.clear();
                          dialog.dissmiss();
                          // Navigator.pop(context);
                        },
                        textShown: 'Save',
                        width: width,
                        height: height,
                      ),
                      ActionButton(
                        dialog: dialog,
                        eventOnTap: () {
                          dialog.dissmiss();
                        },
                        textShown: 'Close',
                        width: width,
                        height: height,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )..show();
        },
      ),
    );
  }
}
