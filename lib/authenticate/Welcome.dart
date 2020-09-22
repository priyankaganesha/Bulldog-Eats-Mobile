import 'package:bulldog_eats/authenticate/Sign_in.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/authenticate/Register.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[700],
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Text(
                    'Welcome to Bulldog Eats!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn(),
                            fullscreenDialog: true),
                      );
                    }),
                RaisedButton(
                    color: Colors.pink[400],
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register(),
                            fullscreenDialog: true),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
