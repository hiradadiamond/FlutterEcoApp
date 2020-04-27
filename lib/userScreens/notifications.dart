import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: new Text("Order Notifications"),
      ),
      body: new Center(
        child: new Text("This is notifications", style: new TextStyle(fontSize: 25.0),),
      ),
    );
  }
}
