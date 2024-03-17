import 'package:flutter/material.dart';
import 'package:web_scratchpad/models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get value => _notes;

  void addNote(Note note) {
    _notes = [
      ..._notes,
      Note(description: note.description, title: note.title)
    ];
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.remove(_notes[index]);
    notifyListeners();
  }
}
