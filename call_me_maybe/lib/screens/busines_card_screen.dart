import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCardScreen extends StatefulWidget {
  
  @override
  _BusinessCardScreenState createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            formatText('Kylee Bonds'),
            paddedPhoto(),
            formatText('Full Stack Student'),
            GestureDetector(
              onTap: () => launch('sms: 5555555555'),
              child: Text('(555) 555-5555', 
                style: TextStyle(
              fontFamily: 'STIXTwoMath',
              fontSize: 14))),
            linksRow(),
          ]))
    );
  }

  Widget formatText(text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text('${text}', 
        style: TextStyle(
          color: Colors.pink.withOpacity(0.9),
          fontFamily: 'STIXTwoMath', 
        fontSize: 18, 
        fontWeight: FontWeight.bold)
    ));
  }

  Widget paddedPhoto() {
    return Padding(
        padding: EdgeInsets.all(2),
        child: SizedBox(
            child: Image.asset('lib/assets/images/pineapple.jpg'), width: 100, height: 100));
  }

  Widget paddedLinks(text, link) {
    return Padding(
        padding: EdgeInsets.all(20),
          child: SizedBox(
            child:
            GestureDetector(
              onTap: () => launch('${link}'),
              child: Text('${text}', 
                style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontFamily: 'STIXTwoMath',
              fontSize: 14)),
              )
            )
          )
        ;
  }

  Widget linksRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [paddedLinks('jsmith@gmail.com', 'mailto:jsmith@gmail.com'), paddedLinks('https://github.com/halekyl', 'https://github.com/halekyl')]);
  }
}


