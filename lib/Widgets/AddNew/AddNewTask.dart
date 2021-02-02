import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({Key key, this.typeofAdd, this.iconofAdd})
      : super(key: key);
  final String typeofAdd;
  final iconofAdd;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedButton(
      buttonTextStyle:
          TextStyle(color: Theme.of(context).accentColor, fontSize: 14),
      icon: Icons.add,
      text: 'Add ' + typeofAdd,
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
                // buildAddTaskWidget(context),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      dialog: dialog,
                      eventOnTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildAddTaskWidget(context),
                        );
                      },
                      // textShown: 'Close',
                      textShown: 'Add new task',
                      width: width,
                      height: height,
                    ),
                    ActionButton(
                      dialog: dialog,
                      eventOnTap: () {
                        dialog.dissmiss();
                      },
                      textShown: 'save',
                      width: width,
                      height: height,
                    ),
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.only(top: height * .01),
                //   child: AnimatedButton(
                //     isFixedWidth: false,
                //     buttonTextStyle: TextStyle(
                //         color: Theme.of(context).accentColor, fontSize: 14),
                //     buttonDecoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(100)),
                //         color: Theme.of(context).dividerColor),
                //     text: 'Add new task',
                //     pressEvent: () {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) =>
                //             buildAddTaskWidget(context),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        )..show();
      },
    );
  }
}

Widget buildAddTaskWidget(BuildContext context) {
  return Material(
    elevation: 0,
    color: Colors.blueGrey.withAlpha(40),
    child: TextFormField(
      autofocus: true,
      keyboardType: TextInputType.multiline,
      maxLengthEnforced: true,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'task',
        prefixIcon: Icon(Icons.text_fields),
      ),
    ),
  );
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required this.dialog,
    @required this.textShown,
    @required this.eventOnTap,
    @required this.width,
    @required this.height,
  }) : super(key: key);
  final AwesomeDialog dialog;
  final String textShown;
  final Function eventOnTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .02),
        padding: EdgeInsets.symmetric(
            horizontal: width * .05, vertical: height * .02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Theme.of(context).dividerColor),
        child: GestureDetector(
          onTap: eventOnTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                textShown,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}