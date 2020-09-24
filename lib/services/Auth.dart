import 'package:firebase_auth/firebase_auth.dart';
import 'package:bulldog_eats/authenticate/models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on User

  TheUser _fromFirebaseUser(User user) {
    //user model
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // Auth change user stream -- shows signIn and signOut changes
  Stream<TheUser> get user {
    return _auth.authStateChanges().map(_fromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      //taking firebase user and turning it into a regular user
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
      //catching error, print it, then return null
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;
      user.sendEmailVerification();
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Reset password
  Future sendPasswordResetEmail(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
