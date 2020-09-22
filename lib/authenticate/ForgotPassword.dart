import 'package:bulldog_eats/shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/services/Auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[700],
        elevation: 0.0,
        title: Text(
          'Reset Password',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 40.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter Your Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter Your email' : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    }),
                // TextFormField
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        await _auth.sendPasswordResetEmail(email);
                        setState(() {
                          message =
                              "A reset password link has been sent to $email";
                        });
                        // Need it to check if the email exists in the database and if it doesn't, it will return this message
                      } else {
                        setState(() {
                          message =
                              'Could not send link to reset password. Please check if email is correct.';
                        });
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  message,
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
