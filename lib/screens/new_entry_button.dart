import "package:flutter/material.dart";
import '../widgets/journal_entry_form.dart';
import '../widgets/journal_scaffold.dart';

class NewEntryButton extends StatelessWidget {
  static const route = '/entryForm';
  
  final title = 'New Journal Entry';
  final state;
  final modifier;

  NewEntryButton({Key? key, this.state, this.modifier}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final journalModifier = ModalRoute.of(context)!.settings.arguments;
    return JournalScaffold(
      modifier: modifier,
      state: state,
      title: title,
      body:EntryForm(modifier: journalModifier),
    );   
  }
}