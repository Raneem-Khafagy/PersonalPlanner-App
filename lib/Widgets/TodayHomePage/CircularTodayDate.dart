import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(8),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 11),
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
            AddNewWidget(
              width: width,
              height: height,
              typeofAdd: "Add new note",
            ),
            AddNewWidget(
              width: width,
              height: height,
              typeofAdd: "Add new task",
            ),
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
        //color: Color(0xCFBDBEC0),
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
