// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:homepage/utilities/note_models/note_data.dart';
import 'package:provider/provider.dart';

import '../utilities/note_models/note.dart';

class EditingNotePage extends StatefulWidget {
  final Note note;
  final bool isNewNote;
  const EditingNotePage(
      {super.key, required this.note, required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  //initial state
  @override
  void initState() {
    super.initState();
    loadExisitingNote();
  }

  // load existing note

  void loadExisitingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void addNewNote() {
    // get text from editor
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).addNewNote(
      Note(id: id, text: text),
    );
  }
  // update note

  void updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // new note
            if (widget.isNewNote && !_controller.document.isEmpty()) {
              addNewNote();
            } else {
              updateNote();
            }
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Column(children: [
        QuillToolbar.basic(controller: _controller),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(25),
          child: QuillEditor.basic(
            controller: _controller,
            readOnly: false,
          ),
        ))
      ]),
    );
  }
}
