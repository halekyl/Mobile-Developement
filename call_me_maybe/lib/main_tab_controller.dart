import 'package:flutter/material.dart';
import 'screens/busines_card_screen.dart';
import 'screens/predict_screen.dart';
import 'screens/resume_screen.dart';
import 'package:call_me_maybe/screens/predict_screen.dart';

class MainTabController extends StatelessWidget {
  static const tabsList = [
    Tab(icon: Icon(Icons.account_circle)),
    Tab(icon: Icon(Icons.contact_page)),
    Tab(icon: Icon(Icons.help)),
  ];

  final screens = [
    BusinessCardScreen(), 
    ResumeScreen(),
    PredictScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabsList.length,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                title: Text('Call Me Maybe'),
                bottom: TabBar(tabs: tabsList)),
            body: TabBarView(children: screens)));
  }
}
