import 'package:flutter/material.dart';

import 'HomePageBodyContent/CircularTodayDate.dart';
import 'HomePageBodyContent/bla.dart';

class HomePageBodyContent extends StatelessWidget {
  final height, width;
  const HomePageBodyContent({Key key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        heightFactor: 1.5,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * .02,
            ),
            CircularTodayDate(height: height, width: width),
            SizedBox(
              height: height * .02,
            ),
            // NotesList(),
          ],
        ),
      ),
    );
  }
}
