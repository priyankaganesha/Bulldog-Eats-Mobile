import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  Name({Key key}) : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
        backgroundColor: Color(0xFF9dd2dc),
      ),
      body:
      Container(
        padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 500.0),
          child: Center(
            child: Text('Make a Post (1/3)\n Name of Event', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30)
            ),
          )
      )
    );
  }
}
