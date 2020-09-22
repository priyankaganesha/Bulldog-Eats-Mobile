import 'package:flutter/material.dart';
import 'package:bulldog_eats/pages/newPost/Name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bulldog_eats/pages/EditPost/NameEdit.dart';

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
        automaticallyImplyLeading: false,
        title: Center(
          child : Column(
              children: <Widget>[
                Text("Hello Jasmine!", style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,),
              ],
            ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
        body: MyButtons(),
      backgroundColor: Colors.white,


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
    return Column(
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Your Ongoing Post", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  prevPosts(),
                ],
              ),
            ),
          )
        ),
        Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Name()),
                        );
                      },
                      child: Text('Make Post', style: TextStyle(fontSize: 20, color: Colors.black)),
                      color: Colors.white,
                    ),
                    RaisedButton(
                      onPressed: () {
                        //prevPosts.editData();

                      },
                      child: const Text('Edit Post', style: TextStyle(fontSize: 20, color: Colors.black)),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
        ),
      ],
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

class prevPosts extends StatelessWidget {
  prevPosts({Key key}) : super(key: key);

  final DBRef = FirebaseDatabase.instance.reference().child('posts');
  final List<dynamic> lists = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBRef.orderByChild("title").equalTo("a potato").once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          String id = "";
          bool hasData = false;
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            if (values != null){
              hasData = true;
              values.forEach((key, values) {
                id = key;
                lists.add(values);
              });
            }
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  if (!hasData){
                    return Card(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("If you have an active post, it will appear here..."),
                            ]
                        )
                    );
                  }
                  if (hasData){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(lists[index]["title"]),
                          Text("Where: "+ lists[index]["location"]),
                          Text("Until: " +lists[index]["until"]),
                          Text("Description: "  +lists[index]["description"]),
                          new Column(
                            children: <Widget>[
                              new RaisedButton(
                                onPressed: (){
                                  editData(id, context);
                                },
                                child: Text("Edit"),
                              ),
                              new RaisedButton(
                                onPressed: (){
                                  deletePost(id);
                                },
                                child: Text("Delete"),
                              )
                            ],
                          ),
                        ],
                      ),
                      elevation: 0.0,
                    );
                  }
                });
          }
          return CircularProgressIndicator();
        });
  }

  void editData(String id, context){
    String name;
    String location;
    String time;
    String description;
    name = lists[0]["title"];
    location = lists[0]["location"];
    time = lists[0]["until"];
    description = lists[0]["description"];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NameEdit(id: id, name: name, location: location, time: time, description: description)),
    );
  }

  void deletePost(String id){
    DBRef.child(id).remove();
  }

}