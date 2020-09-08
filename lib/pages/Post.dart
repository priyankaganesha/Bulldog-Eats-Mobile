import 'package:flutter/material.dart';
import 'package:bulldog_eats/pages/newPost/Name.dart';
//import 'package:bulldog_eats/pages/newPost/Description.dart';
//import 'package:bulldog_eats/pages/newPost/ImageUpload.dart';
//import 'package:bulldog_eats/pages/newPost/Confirmation.dart';

class Post extends StatefulWidget {
  Post({Key key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(100),
          child: Text("Post Options", style: TextStyle(fontSize: 30)),
        ),
        backgroundColor: Color(0xFF9dd2dc),
      ),
        body: MyButtons(),


      /*ButtonTheme(
          minWidth: 170.0,
          height: 50.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),*/
              /*child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder:  (BuildContext context) {
                    return new Name();
                  }
                  )
                  );
                  },
                color: Color(0xffe9903d),
                child: Text("Button", style: TextStyle(color: Colors.black),
                ),
              )*/

        //)
        //)
    );
  }
}

class MyButtons extends StatelessWidget{
  MyButtons({Key key}) : super(key: key);

  //final DBRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext) {
                return new Name();
              }
              )
              );
            },
            child: Text('Make Post', style: TextStyle(fontSize: 20)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xffe9903d),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              //writeData();

            },
            child: const Text('Edit Post', style: TextStyle(fontSize: 20)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xffe9903d),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  /*void writeData(){
    DBRef.child("posts").push().set({
        'description': "sour",
        "id" : "1",
        "image" : "none",
        "location" : "bellevue college",
        "title" : "lime",
        "uid" : "idk",
        "until" : "forever"
    });
  }*/
}