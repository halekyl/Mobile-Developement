import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: 
        Column(
          children: [
            nameFormat('Kylee Bonds'),
            linksRow('jsmith@gmail.com', 'mailto:jsmith@gmail.com'),
            linksRow('https://github.com/halekyl', 'https://github.com/halekyl'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli.'),
                        priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli,  do. eiusmod tempor incid ation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid adipiscing elit, sed do. eiusmod tempor incid  ,ation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli.'),
            priorPositionsTitleRow('Junior Software Engineer'),
            priorPositionsDetailRow('E Corp', '2016-Present', 'Springfield, OR'),
            priorPostitionRow(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli, consectetur adipiscing elit, sed do. eiusmod tempor incid ation tate veli.')
          ])
      );
  }

  Widget nameFormat(name) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
      child: Row(children: [
        Text('${name}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontFamily: 'STIXTwoMath', 
              fontSize: 26))
      ]),
    );
  }

  Widget paddedLinks(text, link) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: SizedBox(
            child: GestureDetector(
                onTap: () => launch('${link}'),
                child: Text(
                  '${text}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontFamily: 'STIXTwoMath',
                    fontSize: 16,
                  ),
                ))));
  }

  Widget linksRow(email, link) {
    return Row(children: [paddedLinks(email, link)]);
  }

  Widget paddedPositionTitle(title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Row(children: [
        Text('${title}',
            style: TextStyle(
                fontFamily: 'STIXTwoMath',
                fontSize: 14,
                fontWeight: FontWeight.bold))
      ]),
    );
  }

  Widget priorPositionsTitleRow(title) {
    return Row(children: [paddedPositionTitle(title)]);
  }

  Widget paddedPositionDetails(text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(children: [
        Text('${text}',
            style: TextStyle(
              fontFamily: 'STIXTwoMath',
              fontSize: 12,
            ))
      ]),
    );
  }

  Widget priorPositionsDetailRow(company, date, location) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      paddedPositionDetails(company),
      paddedPositionDetails(date),
      paddedPositionDetails(location)
    ]);
  }

  Widget paddedPriorPosition(text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text('${text}',
          style: TextStyle(
          fontFamily: 'STIXTwoMath',
          fontSize: 12,
          )),
    );
  }

  Widget priorPostitionRow(text) {
    return
      paddedPriorPosition(text)
    ;
  }
}
