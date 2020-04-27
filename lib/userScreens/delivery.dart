import 'package:flutter/material.dart';
class DeliverAddress extends StatefulWidget {
  @override
  _DeliverAddressState createState() => _DeliverAddressState();
}

class _DeliverAddressState extends State<DeliverAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        title: new Text("Delivery Address"),
      ),
      body: new Center(
        child: new Text("Deliver Page"),
      ),
    );
  }
}
