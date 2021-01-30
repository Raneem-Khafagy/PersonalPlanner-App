import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CircularTodayDate extends StatelessWidget {
  final height, width;
  CircularTodayDate({Key key, this.height, this.width}) : super(key: key);

  String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String day = DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width * 0.37,
          height: width * 0.37,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 1),
                blurRadius: 6.0,
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
                        color: Colors.blue,
                        fontSize: 61,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 11),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.black87,
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
          height: 21,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 11,
              width: 11,
              margin: EdgeInsets.only(right: 11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
            Container(
              height: 11,
              width: 11,
              margin: EdgeInsets.only(right: 11.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            Container(
              height: 11,
              width: 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
