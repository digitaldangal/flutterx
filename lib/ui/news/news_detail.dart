import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterx/domain/entity/news.dart';
import 'package:meta/meta.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();


  NewsDetailPage({@required this.news});

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: news.url,
      appBar: new AppBar(
        title: new Text(news.title),
      ),

    );
  }
}
