import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  String title = "Notes app";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[200],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('Hello')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Hello',
        child: Icon(Icons.add),
      ),
    );
  }
}
