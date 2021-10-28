import 'package:flutter/material.dart';

class ThemeDrawer extends StatefulWidget {

  final body;
  final floatingActionButton;
  final String title;
  final modeChange;
  final state;

  ThemeDrawer({Key? key, required this.body,
  this.floatingActionButton, required this.title, this.modeChange, this.state}) : super(key : key);

  @override
  _ThemeDrawer createState() => _ThemeDrawer();
}

class _ThemeDrawer extends State<ThemeDrawer> {
  bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          Builder(builder: (context) => 
          IconButton(icon: Icon(Icons.settings), 
            onPressed: () => Scaffold.of(context).openEndDrawer()
            ,tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),)
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 60,
              child: DrawerHeader(
                child: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(children: <Widget>[
                Align(alignment: Alignment.center, child: Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold))),
                Align(alignment: Alignment.center, 
                  child: Switch(value: widget.state, 
                    onChanged: (value) {
                      widget.modeChange(value); 
                       }))
              ],),
            )
          ],
        )
      ),
      floatingActionButton: showButton(),
      body: widget.body,
    );
  }

  showButton() {
    return widget.floatingActionButton ?? Container();
  }
}