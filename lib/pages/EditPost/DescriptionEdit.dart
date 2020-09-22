import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:bulldog_eats/pages/Post.dart';

class DescriptionEdit extends StatefulWidget {
  DescriptionEdit({Key key, this.id, this.name, this.location, this.time, this.description}) : super(key: key);
  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  @override
  _MainOne createState() => new _MainOne(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description);
}

class _MainOne extends State<DescriptionEdit> {

  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  _MainOne({this.id, this.name, this.location, this.time, this.description});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Make a Post (2/3)",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic)
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MakePost2(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description,),
                ]),
          )
      ),
    );
  }
}

class MakePost2 extends StatefulWidget {
  MakePost2({Key key, this.id, this.name, this.location, this.time, this.description}) : super(key: key);
  final String id;
  final String name;
  final String location;
  final String time;
  final String description;

  @override
  _MakePost2State createState() => _MakePost2State(id: this.id, name: this.name, location: this.location, time: this.time, description: this.description);
}

class _MakePost2State extends State<MakePost2>{

  final String id;
  final String name;
  final String location;
  final String time;
  final String description;
  final _formKey = GlobalKey<FormState>();
  final DescriptionController = TextEditingController();
  final DBRef = FirebaseDatabase.instance.reference().child("posts");

  _MakePost2State({this.id, this.name, this.location, this.time, this.description});

  void initState() {
    DescriptionController.text = this.description;
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
                keyboardType: TextInputType.multiline,
                controller: DescriptionController,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: "Event Description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value){
                  if (value.isEmpty){
                    return 'Enter an Event Description';
                  }
                  return null;
                },
                maxLines: 5,
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
                      EditData();
                      if (DescriptionController.text != ""){
                        nextPage();
                      }
                    },
                    child: Text('Submit Changes'),
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
        ),
      ),
    );
  }

  void EditData(){

    if(_formKey.currentState.validate()){
      DBRef.child(id).update({
        "location" : this.location,
        "title" : this.name,
        "until" : this.time,
        "description" : DescriptionController.text,
        "uid" : "",
        "image" : ""
      }).then((_) {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Successfully Added')));
        DescriptionController.clear();
      }).catchError((onError){
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(onError)));
      });
    }
  }

  void nextPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Post()),
    );
  }
}

