import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/new_entry_button.dart';
import 'screens/jorunal_entries.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences preferences;
  MyApp({Key? key, required this.preferences}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MODE = 'dark';

  bool get theme => widget.preferences.getBool(MODE) ?? false;

  @override
  Widget build(BuildContext context) {
    final routes = {
      JournalEntries.route: (context) =>
          JournalEntries(modifier: switchTheme, state: theme),
      NewEntryButton.route: (context) =>
          NewEntryButton(modifier: switchTheme, state: theme),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: getMode(),
      ),
      routes: routes,
    );
  }

  Brightness getMode() => theme ? Brightness.dark : Brightness.light;

  void switchTheme(state) {
    setState(() {
      widget.preferences.setBool(MODE, state);
    });
  }
  
}
