import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notesapp/home/home.dart';
import 'package:notesapp/urls.dart';

class CreatePage extends StatefulWidget {
  final Client client;

  const CreatePage({super.key, required this.client});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();

  _create() async {
    try {
      await widget.client.post(Uri.parse(Urls().createNoteUrl()),
          body: {'body': controller.text});
      _returnToHomePage();
    } catch (e) {
      print("Error while creating " + e.toString());
    }
  }

  _returnToHomePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () async {
              await _create();
            },
            child: const Text('Create note'),
          )
        ],
      ),
    );
  }
}
