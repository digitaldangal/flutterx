import 'package:flutter/material.dart';
import '../base_page.dart';
import '../../ui/common.dart';

class MessengerPage extends BasePage implements IPageRegister{
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

  static void registerPage() {
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
