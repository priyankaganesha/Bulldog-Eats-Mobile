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
  /*PageController _pageController = PageController();

  Widget screen = Name();

  int _selectedIndex = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
        body: ButtonTheme(
          minWidth: 170.0,
          height: 50.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: RaisedButton(
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
        )
      )
    );
  }
}