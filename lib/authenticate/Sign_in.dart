import 'package:flutter/material.dart';
import 'package:bulldog_eats/services/Auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: Text('Sign in to Bulldog Eats'),
          actions: <Widget>[
            //Button in corner that allows you to register
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Register'),
                onPressed: () {
                  widget.toggleView();
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(onChanged: (value) {
                  setState(() => email = value);
                }), // TextFormField
                SizedBox(height: 20.0),
                TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() => password = value);
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
