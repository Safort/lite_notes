import 'package:flutter/material.dart';
import 'package:lite_notes/utils/types.dart';

class NotesModel extends ChangeNotifier {
  final List<Note> notes = [];

  addNote(String title, String description) {
    notes.add(Note(title, description));
    notifyListeners();
  }
}
