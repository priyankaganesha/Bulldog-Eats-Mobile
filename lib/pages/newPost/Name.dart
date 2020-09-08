import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bulldog_eats/pages/newPost/Description.dart';
import 'package:bulldog_eats/pages/Post.dart';
import 'package:firebase_database/firebase_database.dart';

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
        title: Padding(
          padding: const EdgeInsets.all(70),
          child: Text("New Post", style: TextStyle(fontSize: 30)),
        ),
        backgroundColor: Color(0xFF9dd2dc),
      ),
      body: MyTexts(),
    );
  }
}

class MyTexts extends StatefulWidget{

   @override
  _MyTextsState createState() => _MyTextsState();
}


class _MyTextsState extends State<MyTexts>{

  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  final LocationController = TextEditingController();
  final DescriptionController = TextEditingController();
  final DBRef = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    NameController.dispose();
    TimeController.dispose();
    LocationController.dispose();
    DescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 100),
                  Text(
                      "Name of Event"
                  ),
                  TextField(
                    controller: NameController,
                  ),
                  const SizedBox(height: 30),
                  Text(
                      "Available Until"
                  ),
                  TextField(
                    controller: TimeController,
                  ),
                  const SizedBox(height: 30),
                  Text(
                      "Location"
                  ),
                  TextField(
                    controller: LocationController,
                  ),
                  const SizedBox(height: 30),
                  Text(
                      "Description of Event"
                  ),
                  TextField(
                    controller: DescriptionController,
                  ),
                  const SizedBox(height: 60),
                  RaisedButton(
                    onPressed: () {
                      writeData();
                    },
                    child: const Text('Create Post', style: TextStyle(fontSize: 20)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    color: Color(0xffe9903d),
                  )
                ]
            )
        )
    );
  }

  void writeData(){
    DBRef.child("posts").push().set({
      'description': "${DescriptionController.text}",
      "image" : "none",
      "location" : "${LocationController.text}",
      "title" : "${NameController.text}",
      "uid" : "TBD",
      "until" : "${TimeController.text}"
    });
    Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext) {
      return new Post();
    }
    )
    );
  }
}