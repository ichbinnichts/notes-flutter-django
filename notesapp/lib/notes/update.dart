import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/urls.dart';

class UpdatePage extends StatefulWidget {
  final Note note;
  final Client client;
  const UpdatePage({super.key, required this.client, required this.note});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();

  _update(int id) async {
    try {
      await widget.client.put(Uri.parse(Urls().updateNoteUrl(id)),
          body: {'body': controller.text});
      _returnToHomePage();
    } catch (e) {
      print('Error while updating note ' + e.toString());
    }
  }

  _returnToHomePage() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    controller.text = widget.note.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update page'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () async {
              await _update(widget.note.id);
            },
            child: const Text('Update note'),
          )
        ],
      ),
    );
  }
}
