import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dto.dart';
import '../models/jorunal_entry.dart';
//import 'package:journal/models/journal_entry.dart';

class EntryForm extends StatefulWidget {
  final entry = JournalEntry(title: '', body: '', date: '', rating: 0);
  final entryInput = JournalEntryDTO();
  final modifier;

  EntryForm({Key? key, this.modifier}) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            entryFieldText(label: 'Title'),
            entryFieldText(label: 'Body'),
            entryFieldInt(label: 'Rating'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                formButton(
                    label: "Cancel",
                    pressFunc: () {
                      Navigator.of(context).pop();
                    }),
                formButton(
                    label: "Save",
                    pressFunc: () {
                      save();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget entryFieldText({label}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
      child: TextFormField(
          autofocus: true,
          decoration:
              InputDecoration(labelText: label, border: OutlineInputBorder()),
          onSaved: (val) {
            switch (label) {
              case ('Title'):
                widget.entryInput.title = val!;
                break;
              case ('Body'):
                widget.entryInput.body = val!;
                break;
            }
          },
          validator: (val) {
            if (val!.isEmpty) {
              return "Field Required";
            } else {
              return null;
            }
          }),
    );
  }

  Widget entryFieldInt({label}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (val) {
          int? value = int.tryParse(val!);
          widget.entryInput.rating = value!;
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please input a Rating";
          }
          int? value = int.tryParse(val);
          if (value! < 1 || value > 4) {
            return 'Please input a Rating between 1 - 4';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget formButton({label, pressFunc, color}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 7, 15, 0),
      child: ElevatedButton(
        onPressed: pressFunc,
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void formatDate() {
    var formatting = DateFormat('EEEE, MMMM d, y');
    widget.entryInput.date = formatting.format(DateTime.now());
  }

  void save() {
    if (_formkey.currentState!.validate()) {
      formatDate();
      final dbManager = DatabaseManager.getInstance();

      _formkey.currentState!.save();
      dbManager.saveJournalEntry(entry: widget.entryInput);
      widget.modifier(JournalEntry(
        body: widget.entryInput.body,
        title: widget.entryInput.title,
        rating: widget.entryInput.rating,
        date: widget.entryInput.date,
      ));

      Navigator.of(context).pop();
    }
  }
}
