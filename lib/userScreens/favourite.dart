import 'package:flutter/material.dart';
class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: new Text("Favourites"),
      ),
      body: new Center(
        child: new Text("Favourite", style: new TextStyle(fontSize: 25.0)),
      ),
    );
  }
}
