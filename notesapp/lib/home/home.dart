import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notesapp/models/note.dart';

class Home extends StatefulWidget {
  Home({super.key});

  String title = "Notes app";
  String hostUrl = "http://localhost:8000";

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

    try {
      var response = await client.get(Uri.parse('${widget.hostUrl}/notes/'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);

        List<Note> noteList = jsonList
            .map((json) => Note(
                  id: json['id'],
                  note: json['body'],
                ))
            .toList();

        notes = noteList;
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error while getting response from API: $e");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[200],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _retrieveNotes();
        },
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(notes[index].note),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
