import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Widgets/TodayHomePage/CircularTodayDate.dart';

//Screans
//homepage

import 'package:myplanner/Widgets/TodayHomePage/HomePageBodyContainer.dart';

import 'package:myplanner/Widgets/TodayHomePage/HomePageHeader.dart';
import 'package:myplanner/Widgets/note.dart';

class TodayHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              HomePageHeader(),
              HomePageBodyContainer(),
            ],
          ),
          CircularTodayDate(),
          // Note(
          //   height: height,
          //   width: width,
          //   title: 'Title',
          //   description:
          //       'description goes over here ! description goes over here !description goes over here !description goes over here !description goes over here !description goes over here !',
          // ),
        ],
      ),
    );
  }
}
