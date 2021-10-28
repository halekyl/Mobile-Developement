import 'package:call_me_maybe/models/predictor.dart';

import 'package:flutter/material.dart';

class PredictScreen extends StatefulWidget {
  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  final prediction = Magic();

  Widget build(BuildContext context) {
    return 
    Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Call me... Maybe?', style: TextStyle(fontFamily: 'Fuggles', fontSize: 50)),
      Padding(
        padding: EdgeInsets.all(20),
        child:
      GestureDetector(
          onTap: () => setState(() => prediction.predict()),
          child: 
          Text('Ask a question... tap for the answer.',
              style: Theme.of(context).textTheme.headline6)),),
          Text('${prediction.response}', 
          style: Theme.of(context).textTheme.headline4),
    ])));
  }

  double padding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.width * 0.02;
    } else {
      return MediaQuery.of(context).size.width * 0.2;
    }
  }
}
