import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myplanner/Controllers/Providers.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key key,
    @required this.height,
    @required this.tranDuration,
  }) : super(key: key);

  final double height;
  final int tranDuration;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: height * .08,
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).backgroundColor,
      buttonBackgroundColor: Theme.of(context).highlightColor,
      animationDuration: Duration(milliseconds: tranDuration),
      animationCurve: Curves.bounceInOut,
      onTap: (index) {},
      index: 0,
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
    );
  }
}
