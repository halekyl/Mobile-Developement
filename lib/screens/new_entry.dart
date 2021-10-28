import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/journal_entry.dart';

class NewEntry extends StatelessWidget {
  static const route = '/entryForm';
  final data;
  final state;
  final modifier;
  
  NewEntry({Key? key, this.data, this.state, this.modifier}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return JournalScaffold(
      title: data.date,
      state: state,
      modifier: modifier,
      body: EntryDisplay(data: data),
    );
  }
}