import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notesapp/models/note.dart';

class Home extends StatefulWidget {
  Home({super.key});

  String title = "Notes app";
  String hostUrl = "http://locahost:8000";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Client client = http.Client();
  List<Note> notes = [];

  void _addNote() {}

  @override
  void initState() {
    _retrieveNotes();
    super.initState();
  }

  _retrieveNotes() async {
    notes = [];

    List response = json
        .decode((await client.get(Uri.parse('${widget.hostUrl}/notes/'))).body);

    response.forEach((element) {
      notes.add(Note.fromMap(element));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(notes[index].note),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
