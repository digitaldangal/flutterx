import 'package:flutter/material.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';

class MessengerPage extends BasePage {
  MessengerPage(MainTab tab) : super(tab) {
    this.title = 'Messenger';
  }

  @override
  State createState() {
    return new _MessengerState();
  }

  @override
  String get navTitle {
    return this.title;
  }
}

class _MessengerState extends State<MessengerPage> {
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
    return new Text('Messenger');
  }
}
