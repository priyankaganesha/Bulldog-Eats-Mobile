import 'package:bulldog_eats/authenticate/Welcome.dart';
import 'package:bulldog_eats/authenticate/models/User.dart';
import 'package:bulldog_eats/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:bulldog_eats/authenticate/Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  //initializes the firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    // StreamProvider listens to the stream and wraps the material app
    // meaning anything wrapped within it can have access to the data provided by the stream
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Bulldogs Eats',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
