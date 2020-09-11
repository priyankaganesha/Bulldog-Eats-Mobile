import 'package:bulldog_eats/pages/Feed.dart';
import 'package:bulldog_eats/pages/Post.dart';
import 'package:bulldog_eats/pages/Settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    Feed(),
    Post(),
    Settings(),
  ];
  //navigating through the pages
  int _selectedIndex = 0;
//Sets Feed to default page when app is opened
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //Creating the PageView function names

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  } //Switching pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Colors.cyan[200],
        //Switching pages
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              color: _selectedIndex == 0 ? Colors.blue[900] : Colors.white,
            ),
            title: Text(
              'Feed',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.blue[900] : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_a_photo,
              color: _selectedIndex == 1 ? Colors.blue[900] : Colors.white,
            ),
            title: Text(
              'Post',
              style: TextStyle(
                color: _selectedIndex == 1 ? Colors.blue[900] : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 2 ? Colors.blue[900] : Colors.white,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: _selectedIndex == 2 ? Colors.blue[900] : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
