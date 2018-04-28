import 'package:meta/meta.dart';
import "package:flutter/material.dart";

class LoadingView extends StatefulWidget {

  BuildContext context;
  LoadingView(@required this.context);

  @override
  _LoadingViewState createState() => new _LoadingViewState();
  void hidden() {
    Navigator.of(context).pop('Hidden'); //所以pop()里面不需要传参,这里关闭对话框并获取回调的值
  }
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child:  new CircularProgressIndicator(backgroundColor: Colors.transparent,),
    );
  }
}
