import "package:flutter/material.dart";

class ICustomBottomNavigationBar {
  void tabSelected(int index, {String title}) => print('I am a interface');
}

class CustomBottomNavigationBar extends StatefulWidget {
  ICustomBottomNavigationBar callback;

  int currentTab = 0;

  CustomBottomNavigationBar({this.currentTab, this.callback});

  @override
  CustomBottomNavigationBarState createState() {
    return new CustomBottomNavigationBarState();
  }
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      currentIndex: widget.currentTab,
      onTap: (int numTab) {
        setState(() {
          widget.currentTab = numTab;
          widget.callback?.tabSelected(widget.currentTab);
        });
      },
      iconSize: 20.0,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        // Visuals, see docs for more information: https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html
        new BottomNavigationBarItem(
            //numTab 0
            icon: new Icon(Icons.info_outline),
            title: new Text("News")),
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(Icons.train),
            title: new Text("Training")),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.message),
            title: new Text("Messenger")),
//        new BottomNavigationBarItem( //numTab 2
//            icon: new Icon(Icons.share),
//            title: new Text("Lucky"),
//        ),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.person),
            title: new Text("Me")),
      ],
    );
  }

  void setSelectedTab(int index) {
    setState(() {
      widget.currentTab = index;
    });
  }
}
