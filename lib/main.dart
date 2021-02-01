import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//screens
import 'Views/Screens/TodayHomePage.dart';
import 'Controllers/Provider/Themes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
  ], child: MyPlanner()));
}

class MyPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPlanner',
      theme: themeNotifier.themeData,
      routes: {
        '/TodayHomePage': (context) => TodayHomePage(),
      },
      home: TodayHomePage(),
    );
  }
}
