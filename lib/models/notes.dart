import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:lite_notes/utils/types.dart';

class NotesModel extends ChangeNotifier {
  List<Note> _notes = [];
  Box box;

  NotesModel() {
    init();
  }

  init() async {
    box = await Hive.openBox<Note>('notes');
    _notes = box.values.toList();

    notifyListeners();
  }

  get notes {
    return _notes;
  }

  addNote(String title, String description) async {
    await box.add(Note(title, description));
    _notes = box.values.toList();
    notifyListeners();
  }
}
