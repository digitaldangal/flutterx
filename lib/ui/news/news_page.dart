import 'package:flutter/material.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';

class NewsPage extends BasePage {
  NewsPage(MainTab tab) : super(tab) {
    this.title = 'News';
  }

  @override
  State createState() {
    return new _NewsState();
  }

  @override
  String get navTitle {
    return this.title;
  }

  static void registerPage() {
  }
}

class _NewsState extends State<NewsPage> {
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
    return new Text('News');
  }



}
