import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AddNewWidgetButton extends StatelessWidget {
  const AddNewWidgetButton({
    Key key,
    this.typeofAdd,
  }) : super(key: key);
  final String typeofAdd;

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
          // animType: AnimType.SCALE,
          //dialogType: DialogType.INFO,
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
                  height: height * 0.01,
                ),
                AnimatedButton(
                    isFixedWidth: false,
                    buttonTextStyle: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 14),
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Theme.of(context).dividerColor),
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
