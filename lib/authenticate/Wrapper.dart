import 'package:bulldog_eats/authenticate/Authenticate.dart';
import 'package:bulldog_eats/authenticate/Welcome.dart';
import 'package:bulldog_eats/authenticate/models/User.dart';
import 'package:bulldog_eats/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// wrapper listens for auth changes
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);
    // return either Home or Authenticate widget
    if (user == null) {
      //change Authenticate to Welcomepage to display the WelcomePage first, but loading will continue forever
      //Might need to add a Navigate.pop to send it to the homepage --> in  progress
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
