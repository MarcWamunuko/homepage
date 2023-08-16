import 'package:flutter/material.dart';
import 'package:homepage/data/hive-database.dart';
import 'package:homepage/utilities/note_models/note.dart';

class NoteData extends ChangeNotifier {
  // hive database

  final db = HiveDatabase();

  // overall list of notes
  List<Note> allNotes = [];

  //initialise list
  void initialiseNotes() {
    allNotes = db.loadNotes();
  }

  // get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // add notes
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
    db.savedNotes(allNotes);
  }

  //update note
  void updateNote(Note note, String text) {
    // loop through the notes
    for (int i = 0; i < allNotes.length; i++) {
      //finds the note needed
      if (allNotes[i].id == note.id) {
        //replaces the text with new text
        allNotes[i].text = text;
      }
    }
    notifyListeners();
    db.savedNotes(allNotes);
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
    db.savedNotes(allNotes);
  }
}
