import 'package:bulldog_eats/authenticate/ForgotPassword.dart';
import 'package:bulldog_eats/shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/services/Auth.dart';
import 'package:bulldog_eats/shared/Loading.dart';

//import 'package:firebase_database/firebase_database.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                'Sign-in to Bulldog Eats',
                style: TextStyle(fontSize: 24),
              ),
              //Button in corner that allows you to register
              //Once login and register from WelcomePage works, don't need to toggle buttons anymore
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Register'),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 40.0),
              //child: Image(
              //       image: AssetImage('assets/BulldogEatsLogo.png'),
              // ),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
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
                      // sign-in button
                      RaisedButton(
                          color: Colors.pink[400],
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text(
                            'Sign In',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          onPressed: () async {
                            // writeData(); --> testing if the sign in connects to the database
                            if (_formkey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign in. Please check if email and password are correct or create an account.';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      // Forgot Password Button
                      RaisedButton(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.pink[400], fontSize: 18.0),
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                  fullscreenDialog: true),
                            );
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

  //void writeData(){
  // final DBRef = FirebaseDatabase.instance.reference().child('posts');
  //DBRef.push().set({
  //'description' : 'this is a test'
  //}
  // );
  // }

}
