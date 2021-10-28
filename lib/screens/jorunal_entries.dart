import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../db/database_manager.dart';
import '../models/jorunal_entry.dart';
import '../models/journal.dart';
import '../screens/new_entry.dart';
import '../screens/welcome.dart';
import '../widgets/journal_entry.dart';
import '../widgets/journal_scaffold.dart';

// ignore: must_be_immutable
class JournalEntries extends StatefulWidget {
  static const route = '/';
  
  late String title = 'Journal Entries';
  final modifier;
  final state;

  JournalEntries({Key? key, this.modifier, this.state}) : super(key: key);
  
  @override
  _JournalEntriesState createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  Journal journal = Journal(entries: []);

  @override
  void initState(){
    super.initState();
    getEntries();
  }

  getEntries() async {
    final dbManager = DatabaseManager.getInstance();
    List<JournalEntry>  recordedData = await dbManager.entries();
    
    if(recordedData.isNotEmpty) {setState(() {
      journal = Journal(entries: recordedData);
      widget.title = 'Journal Entries';
    });}
  }

  final lists = List<Map>.generate(200, (index) {
    return {
      'title' : 'Journal entry $index',
      'subtitle' : 'Subtitle text $index'
    };
  });

  void newEntry(BuildContext context){
    Navigator.of(context).pushNamed('/entryForm',
      arguments: refreshJournal);
  }

  void refreshJournal(entry){
    if (journal.entries.isEmpty) {
      Journal(entries: []); 
    }
    setState(() {
    journal.addEntry(entry);    
    });
  }


  @override
  Widget build(BuildContext context){
    return JournalScaffold(
      title : 'Journal Entries',
      state : widget.state,
      modifier : widget.modifier,
      floatingActionButton: FloatingActionButton(
        onPressed: () {newEntry(context);},
        child: Icon(Icons.add)),
      body: LayoutBuilder(builder: layoutDecider));
  }

  Widget itemList(BuildContext context, card){
    return ListView.builder(
      itemBuilder: (context, index){
        return buildEntryCard(context, index, card);
      },
      itemCount: journal.entries.length);

  }

  Widget buildEntryCard(BuildContext context, index, card) {
    return GestureDetector(
      child: card(index),
      onTap: () { detailPage(context, journal.entries[index]); }
    );      
  }
  
  void detailPage(BuildContext context, JournalEntry data) {
    Navigator.push(context,
      MaterialPageRoute( builder: (context) => NewEntry(data: data) ));
  }

  Widget cardSmall(index) {
    return  Card(
        child: ListTile(
          title: Text("${journal.entries[index].title}"),
          subtitle: Text('${journal.entries[index].date}'),
        ),
      );
  }

  Widget cardLarge(index) {
    return  Card(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
                child: Column( children: <Widget>[
                  Text("${journal.entries[index].title}"),
                  Text('${journal.entries[index].date}'),
                ]),  
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: EntryDisplay(data: journal.entries[index])
            ),
        ],
      ),
    );
  }

  Widget noEntries(context, cardFunc) {
    if(journal.entries.isEmpty) {
      return Welcome();
    } else {
      return itemList(context, cardFunc);
    }
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) {
    return constraints.maxWidth < 700 ? noEntries(context, cardSmall) : noEntries(context, cardLarge);
  }

}