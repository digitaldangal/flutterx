import 'package:flutter/material.dart';

enum MainTab {
  News,
  Training,
  Messenger,
  Me,
}

class FlutterXRoute {
  static Map<String, WidgetBuilder> pageRoute = new Map<String, WidgetBuilder>();
}


class FlutterXRouteData {

  static FlutterXRouteData shareInstance() {
    return _instance;
  }
  FlutterXRouteData() {
    throw new Error();
  }
  FlutterXRouteData._private(){}
  static FlutterXRouteData _instance = FlutterXRouteData._private();
  static Map<String, Object> pageRouteData = new Map<String, Object>();
}


abstract class IPageRegister {
  static void registerPage() {}
}


