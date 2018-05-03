import 'package:flutter/material.dart';

class ListViewSectionSeparator extends StatelessWidget {
  final double height;
  final Color color;
  final String title;

  ListViewSectionSeparator(
      {this.height = 32.0, this.color = Colors.transparent, this.title = ''});

  @override
  Widget build(BuildContext context) {
    Widget sectionTitleView = null;
    if (this.title.length > 0) {
      sectionTitleView = new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(left: 16.0,bottom: 5.0),
            child: new Text(title),
          ),
        ],
      );
    }

    return new Container(
      height: this.height,
      color: this.color,
      child: sectionTitleView,
    );
  }
}
