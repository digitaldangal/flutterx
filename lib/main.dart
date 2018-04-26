import 'package:flutter/material.dart';
import 'package:flutterx/ui/main_page.dart';
import 'package:flutterx/ui/common.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp () {
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
      home: new MainPage(title: 'FlutterXccc'),
      routes: FlutterXRoute.pageRoute,
    );
  }
}
