// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, unused_field, must_be_immutable, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/style/app_style.dart';
import 'dart:math';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            final docNote = FirebaseFirestore.instance
                .collection('Notes')
                .doc(widget.doc.id);
            docNote.update({"note_title": '', "note_content:": ''});
            Navigator.pop(context);
          },
          child: Icon(Icons.edit),
          foregroundColor: Colors.white,
          heroTag: null,
        ),
        SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () {
            final docNote = FirebaseFirestore.instance
                .collection('Notes')
                .doc(widget.doc.id);
            docNote.delete();
            Navigator.pop(context);
          },
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          heroTag: null,
        )
      ]),
    );
  }
}
