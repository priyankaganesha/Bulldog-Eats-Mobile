import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bulldog_eats/pages/EditPost/DescriptionEdit.dart';
import 'package:bulldog_eats/pages/Post.dart';

class NameEdit extends StatefulWidget {
  NameEdit({Key key, this.id, this.name, this.location, this.time, this.description}) : super(key: key);

  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  @override
  _UpdateInfo createState() => new _UpdateInfo(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description);
}

class _UpdateInfo extends State<NameEdit> {

  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  _UpdateInfo({this.id, this.name, this.location, this.time, this.description});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "something",
      theme: ThemeData(
        primaryColor: Color(0xFF9dd2dc),
      ),
      home: UpdateInfo2(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description),
    );
  }
}

class UpdateInfo2 extends StatefulWidget {
  UpdateInfo2({Key key, this.id, this.name, this.location, this.time, this.description}) : super(key : key);
  final String id;
  final String name;
  final String location;
  final String time;
  final String description;


  @override
  _UpdateInfo2State createState() => _UpdateInfo2State(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description);
}

class _UpdateInfo2State extends State<UpdateInfo2>{
  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  _UpdateInfo2State({this.id, this.name, this.location, this.time, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Make a Post (1/3)",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic)),
                  EditPost1(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description),
                ]),
          )
      ),
    );
  }
}

class EditPost1 extends StatefulWidget {
  EditPost1({Key key, this.id, this.name, this.location, this.time, this.description}) : super(key : key);
  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  @override
  _EditPost1State createState() => _EditPost1State(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description);
}

class _EditPost1State extends State<EditPost1> {

  String id;
  String name;
  String location;
  String time;
  final String description;
  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  final LocationController = TextEditingController();
  final DBRef = FirebaseDatabase.instance.reference().child("posts");

  _EditPost1State({this.id, this.name, this.location, this.time, this.description});

  void initState() {
    NameController.text = this.name;
    LocationController.text = this.location;
    TimeController.text = this.time;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: NameController,
                  decoration: InputDecoration(
                    labelText: "Event Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Enter an Event Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: TimeController,
                  decoration: InputDecoration(
                    labelText: "Until",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Enter a Time';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: LocationController,
                  decoration: InputDecoration(
                    labelText: "Event Location",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Enter an Event Location';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0xFF9dd2dc),
                      onPressed: (){
                        this.name = NameController.text;
                        this.location = LocationController.text;
                        this.time = TimeController.text;
                        if (NameController.text != "" || LocationController.text != "" || TimeController.text != ""){
                          nextPage();
                        }
                      },
                      child: Text('Next'),
                    ),
                    RaisedButton(
                      color: Color(0xFF9dd2dc),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Post()),
                        );
                      },
                      child: Text("Cancel"),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  void nextPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DescriptionEdit(id: this.id, name : this.name, location: this.location, time: this.time, description: this.description)),
    );
  }

  void writeData(){
    if(_formKey.currentState.validate()){
      DBRef.push().set({
        "location" : LocationController.text,
        "title" : NameController.text,
        "until" : TimeController.text
      }).then((_) {
        NameController.clear();
        LocationController.clear();
        TimeController.clear();
      }).catchError((onError){
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(onError)));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    NameController.dispose();
    TimeController.dispose();
    LocationController.dispose();
  }
}

