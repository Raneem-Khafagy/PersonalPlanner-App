import 'package:flutter/material.dart';
import 'package:myplanner/Views/Screens/TasksHomePage.dart';
import 'package:provider/provider.dart';
//screens
import 'Controllers/Providers.dart';
import 'Views/Screens/NotesHomePage.dart';
import 'Controllers/Themes.dart';
import 'Views/Screens/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
    ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
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
        '/NotesHomePage': (context) => NotesHomePage(),
        '/TasksHomePage': (context) => TasksHomePage(),
        '/HomeScreen': (context) => HomeScreen(),
      },
      home: HomeScreen(),
    );
  }
}
