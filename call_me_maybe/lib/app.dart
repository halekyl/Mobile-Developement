import 'package:flutter/material.dart';
import 'main_tab_controller.dart';


class App extends StatelessWidget {
  
  final String title;

  const App({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber,
        primarySwatch: Colors.green,
      ),
      home: MainTabController()
    );
  }
}
