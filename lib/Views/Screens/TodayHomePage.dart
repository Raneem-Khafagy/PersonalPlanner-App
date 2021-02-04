import 'dart:developer';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:myplanner/Widgets/TodayHomePage/BottomNavigationBar.dart';
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
          Positioned(
            top: height * .3,
            height: height * 0.7,
            width: width,
            child: Center(
              child: ListView(children: []),
            ),
          ),
        ],
      ),
    );
  }
}
