import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/new_entry.dart';
import 'screens/list_screen.dart';
import 'screens/details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App(title: 'Wasteagram'));
}

class App extends StatelessWidget {
  final String title;
  static final routes = {
    ListScreen.routeName: (context) => ListScreen(), // Home Screen
    NewEntry.routeName: (context) => NewEntry(), // original Camera Screen
    DetailsScreen.routeName: (context) => DetailsScreen(),
  };

  const App({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Wasteagram', theme: ThemeData.dark(), 
    routes: routes
        );
  }
}