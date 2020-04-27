import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: new Text("Messages"),
      ),
      body: new Center(
        child: new Text("Messages", style: new TextStyle(fontSize: 25.0)),
      ),
    );
  }
}
