import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool darkorlight = true;
  var darkIcon = CupertinoIcons.moon_fill;
  var lightIcon = CupertinoIcons.sun_max;
  var iconTheme = CupertinoIcons.moon_fill;
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    secondaryHeaderColor: Colors.grey[400],
    shadowColor: Colors.grey[800],
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.grey[350],
    secondaryHeaderColor: Colors.grey[400],
    shadowColor: Colors.black38,
  );

  ThemeData themeData = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.grey[350],
    secondaryHeaderColor: Colors.grey[400],
    shadowColor: Colors.black38,
  );

  setTheme(bool changeTheme) {
    if (changeTheme == true) {
      themeData = lightTheme;
      iconTheme = darkIcon;
      darkorlight = true;
    } else {
      themeData = darkTheme;
      iconTheme = lightIcon;
      darkorlight = false;
    }

    notifyListeners();
  }
}
