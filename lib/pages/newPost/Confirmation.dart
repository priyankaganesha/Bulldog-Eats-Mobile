import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  Confirmation({Key key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
    );
  }
}
