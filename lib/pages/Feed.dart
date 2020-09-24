import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Feed", style: TextStyle(fontSize: 40, color: Colors.black), textAlign: TextAlign.center,),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: MyFeed(),
      backgroundColor: Colors.white,
    );
  }
}

class MyFeed extends StatefulWidget{

  @override
  _MyFeedState createState() => _MyFeedState();
}


class _MyFeedState extends State<MyFeed>{

  final DBRef = FirebaseDatabase.instance.reference().child('posts');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          List<dynamic> lists = [];
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(lists[index]["title"]),
                        Text("Where: "+ lists[index]["location"]),
                        Text("Until: " +lists[index]["until"]),
                        Text("Description: "  +lists[index]["description"]),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        });
  }
}
