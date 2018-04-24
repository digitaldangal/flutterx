import 'package:flutter/material.dart';
import 'package:flutterx/ui/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterX333',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(title: 'FlutterXccc'),
      routes: <String, WidgetBuilder>{
        // Set named routes
      },
    );
  }
}
