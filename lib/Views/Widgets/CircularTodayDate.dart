import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CircularTodayDate extends StatelessWidget {
  final typeOfItems;
  final String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
  final String day = DateFormat('EEEE').format(DateTime.now());

  CircularTodayDate({Key key, this.typeOfItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: Container(
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
                      SizedBox(height: height * 0.01),
                      Text(
                        typeOfItems,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
