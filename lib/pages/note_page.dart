// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/utilities/note_models/note_data.dart';
import 'package:provider/provider.dart';

import '../utilities/note_models/note.dart';
import 'editing_note_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initialiseNotes();
  }

  //create a new note
  void createNewNote() {
    // create new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    // create a blank note
    Note newNote = Note(
      id: id,
      text: "",
    );

    //go to edit note
    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(note: note, isNewNote: isNewNote),
      ),
    );
  }

  //delete note
  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: Colors.purple[800],
          child: Icon(
            Icons.add,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 75),
              child: Text(
                "Notes",
                style: GoogleFonts.workSans(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            // List of Notes
            value.getAllNotes().isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: Text(
                      "No notes",
                      style: GoogleFonts.workSans(color: Colors.grey[400]),
                    )),
                  )
                : CupertinoListSection.insetGrouped(
                    children: List.generate(
                      value.getAllNotes().length,
                      (index) => CupertinoListTile(
                        title: Text(value.getAllNotes()[index].text),
                        onTap: () =>
                            goToNotePage(value.getAllNotes()[index], false),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              deleteNote(value.getAllNotes()[index]),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
