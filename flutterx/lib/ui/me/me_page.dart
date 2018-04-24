import 'package:flutter/material.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';

class MePage extends BasePage {
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
    return new Text('Me');
  }
}
