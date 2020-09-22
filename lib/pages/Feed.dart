import 'package:flutter/material.dart';

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
        title: Center(
          child: Text(
            "Feed",
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor: Colors.cyan[200],
        elevation: 0.0,
      ),
    );
  }
}
