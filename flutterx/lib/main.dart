import 'package:flutter/material.dart';
import 'package:flutterx/widgets/flutterx_bottom_navigation_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterX',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(title: 'FlutterX'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  String title;
  int pageIndex = 0;
  String page = '';

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MainPage>
    implements ICustomBottomNavigationBar {
  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationBar bottomNavigationBar =
        new CustomBottomNavigationBar(
            currentTab: widget.pageIndex, callback: this);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: bottomNavigationBar,
      // Assigning our navBar to the Scaffold's bottomNavigationBar property.
      body: new Center(
        child: new Text(this.widget.page),
      ),
    );
  }

  @override
  void tabSelected(int index, {String title}) {
    print('selected: $index');
    widget.pageIndex = index;
    setState(() {
      if (title != null) {
        widget.page = title;
      } else {
        widget.page = 'selected: $index';
      }
    });
  }
}
