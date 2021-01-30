import 'package:flutter/material.dart';

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
            CircularProgress(),
            SizedBox(
              height: height * .02,
            ),
            Instructions(),
          ],
        ),
      ),
    );
  }
}
