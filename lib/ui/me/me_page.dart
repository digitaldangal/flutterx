import 'package:flutter/material.dart';
import '../base_page.dart';
import '../../ui/common.dart';
import '../../widgets/listview_section_separator.dart';

class MePage extends BasePage  {
  MePage(MainTab tab) : super(tab) {
    this.title = 'Me';
  }

  @override
  State createState() {
    return new _MeState();
  }

  @override
  String get navTitle {
    return this.title;
  }

  static void registerPage() {
  }
}

class _MeState extends State<MePage> {
  @override
  void initState() {
    super.initState();
    print('initState   page: $this');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ListViewSectionSeparator sectionSpaceTopFirst =
    new ListViewSectionSeparator(height: 12.0);
    ListViewSectionSeparator sectionSpace = new ListViewSectionSeparator(
      height: 16.0,
    );

    return new Container(
      color: Colors.transparent,
      child: new ListView(
        padding: new EdgeInsets.only(top: 0.0, bottom: 8.0),
        children: [
          sectionSpaceTopFirst,
          /*User info*/
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.person,
                size: 40.0,
                color: Colors.green,
              ),
              dense: false,
              isThreeLine: true,
              subtitle: new Text('Email: helloclq@live.cn'),
              title: new Text('User Name'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
              onTap: (){
              },
            ),
          ),
          sectionSpace,
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.settings,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: false,
              title: new Text('Message'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),


          sectionSpace,
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.settings,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: false,
              title: new Text('Favorite'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),
          new Divider(
            height: 0.5,
            indent: 16.0,
          ),
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.settings,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: false,
              title: new Text('Todo List'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),
          new Divider(
            height: 0.5,
            indent: 16.0,
          ),
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.settings,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: false,
              title: new Text('Following'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),
          sectionSpace,
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.settings,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: false,
              title: new Text('Setting'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),

        ],
      ),
    );
  }




}
