import 'package:bulldog_eats/authenticate/Authenticate.dart';
import 'package:bulldog_eats/authenticate/models/User.dart';
import 'package:bulldog_eats/pages/HomePage.dart';
import 'package:bulldog_eats/pages/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bulldog_eats/authenticate/Authenticate.dart';
import 'package:bulldog_eats/authenticate/models/User.dart';

// wrapper listens for auth changes
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);
    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Settings();
    }
  }
}
