import 'package:flutter/material.dart';
import 'common.dart';
import 'package:meta/meta.dart';

abstract class BasePage extends StatefulWidget implements IPageRegister{

  final MainTab tab;

  String title = 'FlutterX';

  BasePage(@required this.tab);

  String get navTitle;



}