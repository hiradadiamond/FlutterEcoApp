import 'package:flutter/material.dart';
class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text("Add Products"),
        centerTitle: false,
        actions: <Widget>[
         new RaisedButton.icon(onPressed: null, icon: Icon(Icons.add), label: new Text("Add images"))
        ],
      ),

    );
  }
}
