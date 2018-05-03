import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/ui/common.dart';
import 'package:flutterx/ui/main_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await _googleSignIn.signInSilently();
  }
  if (currentUser == null) {
    // Force the user to interactively sign in
    currentUser = await _googleSignIn.signIn();
  }

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  // Authenticate with firebase
  final FirebaseUser user = await _auth.signInWithGoogle(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );

  assert(user != null);
  assert(!user.isAnonymous);

  return user;
}

Future<Null> signOutWithGoogle() async {
  // Sign out with firebase
  await _auth.signOut();
  // Sign out with google
  await _googleSignIn.signOut();
}

void main() => runApp(new MyApp());

class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in
    _auth.onAuthStateChanged.firstWhere((user) => user != null).then((user) {
      print('Firebase Login Success::');

      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new MainPage(
                title: 'FlutterX',
              ),
        ),
      );
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 1))
        .then((_) => signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(),
              new SizedBox(width: 20.0),
              new Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    print('My App Constructure...');
    MainPage.registerPage();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterX333',
      color: new Color(0xff00BBF8),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(),
      routes: FlutterXRoute.pageRoute,
    );
  }
}
