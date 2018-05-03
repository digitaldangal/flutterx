import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterx/data/firebase_facade.dart';
import 'package:flutterx/ui/common.dart';
import 'package:flutterx/ui/main_page.dart';

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
    auth().onAuthStateChanged.firstWhere((user) => user != null).then((user) {
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
      home: new MainPage(
        title: 'FlutterX',
      ),
      routes: FlutterXRoute.pageRoute,
    );
  }
}
