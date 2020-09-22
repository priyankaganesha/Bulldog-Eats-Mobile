import 'package:bulldog_eats/services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  // method for AuthService
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor: Colors.cyan[200],
        elevation: 0.0, // The Sign Out Button
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Currently logged into insert email',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RaisedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
                  color: Colors.pink[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
