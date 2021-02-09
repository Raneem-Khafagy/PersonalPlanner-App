import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:myplanner/Views/Screens/NotesHomePage.dart';
import 'package:myplanner/Views/Screens/TasksHomePage.dart';
import 'package:myplanner/Views/Widgets/BackgroundDecoration.dart';
import 'package:myplanner/Views/Widgets/CircularTodayDate.dart';
import 'package:myplanner/Views/Widgets/Header.dart';

import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new AfterSplash(),
        title: Text('My Planner App'),
        image: Image.asset('Images/planner.png'),
        backgroundColor: Theme.of(context).backgroundColor,
        styleTextUnderTheLoader: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 61,
          fontWeight: FontWeight.bold,
        ),
        photoSize: height * 0.3,
      ),
      // loaderColor: Theme.of(context).accentColor),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final int tranDuration = 100;
    return new Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: Provider.of<PageProvider>(context).pageController,
            onPageChanged: (newPage) {
              Provider.of<PageProvider>(context, listen: false)
                  .changePage(newPage);
            },
            children: [
              NotesHomePage(),
              TasksHomePage(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: height * .08,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        buttonBackgroundColor: Theme.of(context).highlightColor,
        animationDuration: Duration(milliseconds: tranDuration),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {},
        index: Provider.of<PageProvider>(context, listen: false).pageNumber,
        items: <Widget>[
          GestureDetector(
            onTap: () {
              Provider.of<PageProvider>(context, listen: false)
                  .pageController
                  .animateToPage(
                    0,
                    duration: Duration(milliseconds: tranDuration),
                    curve: Curves.easeInOut,
                  );
            },
            child: Icon(
              (CupertinoIcons.square_pencil),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<PageProvider>(context, listen: false)
                  .pageController
                  .animateToPage(
                    1,
                    duration: Duration(milliseconds: tranDuration),
                    curve: Curves.easeInOut,
                  );
            },
            child: Icon(
              (CupertinoIcons.list_bullet),
            ),
          ),
        ],
      ),
    );
  }
}
