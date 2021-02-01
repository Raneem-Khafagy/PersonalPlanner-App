import 'package:flutter/material.dart';
import 'package:myplanner/Widgets/AddNew/AddNewNote.dart';

class HomePageBodyContent extends StatelessWidget {
  final headLineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: height * .3,
          width: width,
          height: height * .7,
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
