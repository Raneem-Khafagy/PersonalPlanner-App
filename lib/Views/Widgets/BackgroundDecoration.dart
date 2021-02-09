import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:myplanner/Controllers/Themes.dart';
import 'package:myplanner/Views/Screens/NotesHomePage.dart';
import 'package:provider/provider.dart';

class BackgroundDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Flexible(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(
                height * .3,
                width * .13,
              ),
              topRight: Radius.elliptical(
                height * .3,
                width * .13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
