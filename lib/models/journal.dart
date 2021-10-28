import 'package:journal/models/jorunal_entry.dart';

class Journal {

  List<JournalEntry> entries = [];
  
  Journal({required this.entries});

  void addEntry(entry) {
    entries.isEmpty ? entries = [entry] : entries.add(entry);
  }

}