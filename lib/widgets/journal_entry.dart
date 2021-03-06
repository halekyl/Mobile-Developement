import 'package:flutter/material.dart';

class EntryDisplay extends StatelessWidget {

  final data;

  EntryDisplay({Key? key, this.data}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(data.title, style: TextStyle(fontSize: 22)),
        Text(data.body, style: TextStyle(fontSize: 16)),
      ],
    );
  }

}