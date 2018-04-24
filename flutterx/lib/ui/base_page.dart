import 'package:flutter/material.dart';
import 'package:flutterx/ui/common.dart';
import 'package:meta/meta.dart';

abstract class BasePage extends StatefulWidget{

  final MainTab tab;

  String title = 'FlutterX';

  BasePage(@required this.tab);

  String get navTitle;
}