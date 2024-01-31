import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/notes/create.dart';
import 'package:notesapp/notes/update.dart';
import 'package:notesapp/urls.dart';

class Home extends StatefulWidget {
  Home({super.key});

  String title = "Notes app";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Client client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    _retrieveNotes();
    super.initState();
  }

  _goToCreatePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => CreatePage(
        client: client,
      ),
    ));
  }

  void _deleteNote(int id) async {
    try {
      var response = await client.delete(Uri.parse(Urls().deleteNoteUrl(id)));

      if (response.statusCode == 200) {
        _retrieveNotes();
      } else {
        print(
            'API request failed on delete method with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while deleting data from api ' + e.toString());
    }
  }

  _retrieveNotes() async {
    notes = [];

    try {
      var response = await client.get(Uri.parse(Urls().getNotesUrl()));

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

  _goToUpdatePage(Note note) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            UpdatePage(client: client, note: note)));
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
                onTap: () {
                  _goToUpdatePage(notes[index]);
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteNote(notes[index].id),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreatePage(),
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
