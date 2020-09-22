import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bulldog_eats/pages/newPost/Description.dart';
import 'package:bulldog_eats/pages/Post.dart';
import 'package:firebase_database/firebase_database.dart';

class Name extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "something",
      theme: ThemeData(
        primaryColor: Color(0xFF9dd2dc),
      ),
      home: GetInfo(title: 'Make a Post'),
    );
  }
}

class GetInfo extends StatefulWidget {
  GetInfo({Key key, this.title}) : super(key : key);
  final String title;


  @override
  _GetInfoState createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo>{

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
              MakePost1(),
                ]),
              )
          ),
        );
  }
}

class MakePost1 extends StatefulWidget {
  MakePost1({Key key}) : super(key : key);

  @override
  _MakePost1State createState() => _MakePost1State();
}

class _MakePost1State extends State<MakePost1> {

  String name;
  String location;
  String time;
  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  final LocationController = TextEditingController();
  final DBRef = FirebaseDatabase.instance.reference().child("posts");

  _MakePost1State({this.name, this.location, this.time});

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
      MaterialPageRoute(builder: (context) => Description(name : this.name, location: this.location, time: this.time,)),
    );
  }

  /*void writeData(){
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
  }*/

  @override
  void dispose() {
    super.dispose();
    NameController.dispose();
    TimeController.dispose();
    LocationController.dispose();
  }
}