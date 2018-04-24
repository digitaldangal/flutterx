import 'package:flutter/material.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';

class TrainingPage extends BasePage {
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
    return new Text('Training');
  }
}
