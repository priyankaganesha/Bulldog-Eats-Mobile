import 'package:bulldog_eats/shared/constants.dart';
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
  final _formkey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent[700],
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[700],
          elevation: 0.0,
          title: Text('Sign-in to Bulldog Eats'),
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
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter an Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter an email' : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    }), // TextFormField
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter a Password'),
                    obscureText: true,
                    validator: (value) => value.length < 6
                        ? 'Enter a password 6+ characters long'
                        : null,
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
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error =
                            'Could not sign in. Please check if email and password are correct or create an account.');
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }
}
