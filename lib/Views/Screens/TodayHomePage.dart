import 'dart:ui';

import 'package:flutter/material.dart';
//Screans
//homepage
import 'package:todo/Widgets/TodayHomePage/HomePageBodyContainer.dart';
import 'package:todo/Widgets/TodayHomePage/HomePageBodyContent.dart';
import 'package:todo/Widgets/TodayHomePage/HomePageHeader.dart';

//
class TodayHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xff4c4eea),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                HomePageHeader(height: height, width: width),
                HomePageBodyContainer(height: height, width: width),
              ],
            ),
            HomePageBodyContent(height: height, width: width),
          ],
        ),
      ),
    );
  }
}
