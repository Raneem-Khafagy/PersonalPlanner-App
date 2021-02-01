import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Widgets/AddNew/AddNewNote.dart';

class CircularTodayDate extends StatelessWidget {
  final String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
  final String day = DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width * 0.37,
          height: width * 0.37,
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
          padding: EdgeInsets.symmetric(
              horizontal: width * .014, vertical: height * .007),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(8),
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      day,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 61,
                        //fontSize: height * 0.09,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      date,
                      style: TextStyle(
                        color: Color(0xCF9FA4AC),
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * .4,
              child: AddNewWidgetButton(
                typeofAdd: 'new note',
              ),
            ),
            Container(
              width: width * .4,
              child: AddNewWidgetButton(
                typeofAdd: 'new task',
              ),
            ),
            // AddNewWidget(
            //   width: width,
            //   height: height,
            //   typeofAdd: "Add new task",
            // ),
          ],
        ),
      ],
    );
  }
}

class AddNewWidget extends StatelessWidget {
  const AddNewWidget({
    Key key,
    @required this.typeofAdd,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final String typeofAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * .03, vertical: height * .007),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
          ),
          Text(
            typeofAdd,
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
