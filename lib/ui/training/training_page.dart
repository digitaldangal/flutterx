import 'package:flutter/material.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';
import 'package:flutterx/widgets/listview_section_separator.dart';
import 'package:flutterx/ui/training/course_detail.dart';

class TrainingPage extends BasePage implements IPageRegister {

  static void registerPage() {
    FlutterXRoute.pageRoute[CourseDetailPage.routeTrainingCourse] = (BuildContext context) => new CourseDetailPage();
  }


  TrainingPage(MainTab tab) : super(tab) {
    this.title = 'Training';
  }

  @override
  State createState() {
    return new _TrainingState();
  }

  @override
  String get navTitle {
    print('navTitle   page: $this  title:$title');
    return this.title;
  }
}

class _TrainingState extends State<TrainingPage> {
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
                Navigator.of(context).pushNamed(CourseDetailPage.routeTrainingCourse);
              },
            ),
          ),
          new ListViewSectionSeparator(
            height: 38.0,
            title: 'Current',
          ),
          new Container(
            color: Colors.white,
            child: new ListTile(
              leading: new Icon(
                Icons.inbox,
                size: 18.0,
                color: Colors.green,
              ),
              dense: true,
              isThreeLine: true,
              title: new Text('Current Course Name'),
              subtitle: new Text('Progress: 80 % (4 / 5)'),
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: 13.0,
                color: Colors.green,
              ),
            ),
          ),
          new ListViewSectionSeparator(
            height: 38.0,
            title: 'Courses List',
          ),
          _newCourse(),
          new ListViewSectionSeparator(
            height: 38.0,
            title: 'Finished',
          ),
          _finishedCourse(),
        ],
      ),
    );
  }

  Widget _newCourse() {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new ListTile(
            leading: new Icon(
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name1'),
            subtitle: new Text('Progress: 0 % (0 / 5)'),
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
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name2'),
            subtitle: new Text('Progress: 80 % (4 / 5)'),
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
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name3'),
            subtitle: new Text('Progress: 80 % (4 / 5)'),
            trailing: new Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _finishedCourse() {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new ListTile(
            leading: new Icon(
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name1'),
            subtitle: new Text('Progress: 0 % (0 / 5)'),
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
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name2'),
            subtitle: new Text('Progress: 80 % (4 / 5)'),
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
              Icons.inbox,
              size: 18.0,
              color: Colors.green,
            ),
            dense: true,
            isThreeLine: true,
            title: new Text('Current Course Name3'),
            subtitle: new Text('Progress: 80 % (4 / 5)'),
            trailing: new Icon(
              Icons.arrow_forward_ios,
              size: 13.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
