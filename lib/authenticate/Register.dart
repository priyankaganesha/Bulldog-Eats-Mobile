import 'package:bulldog_eats/shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/services/Auth.dart';
import 'package:bulldog_eats/shared/Loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.cyanAccent[700],
            appBar: AppBar(
              backgroundColor: Colors.cyanAccent[700],
              elevation: 0.0,
              title: Text(
                'Sign-up for Bulldog Eats',
                style: TextStyle(fontSize: 24),
              ),
              // Button in corner that allows you to sign in
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Sign In'),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 40.0),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      //email textbox
                      TextFormField(
                          //created a constant for the textbox and defined the text inside individually
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter an Email'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter an email' : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          }), // TextFormField
                      SizedBox(height: 20.0),
                      // password textbox
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Create a Password'),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text(
                            'Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              // What is currently does... Sends verification email to user, but still takes them to the homepage
                              //Even without verifying email, can still sign in
                              //Need to fix that to only allowing user access if they verified email
                              //Find way to incorporate loading screen as well or just don't have it at all
                              // setState(() => loading = true);
                              setState(() {
                                error =
                                    'A link has been sent to verify your email!';
                              });

                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);

                              if (result == null) {
                                setState(() {
                                  error = 'Please input a valid email.';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
