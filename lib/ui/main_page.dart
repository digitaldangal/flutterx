import 'package:flutter/material.dart';
import '../data/data_facade.dart';
import 'base_page.dart';
import 'common.dart';
import 'me/me_page.dart';
import 'messenger/messenger_page.dart';
import 'news/news_page.dart';
import 'training/training_page.dart';
import '../widgets/flutterx_bottom_navigation_bar.dart';
import '../widgets/flutterx_loading_dialog.dart';
import 'dart:async';


class MainPage extends StatefulWidget {
  static const String routeMain = "/";

  static void registerPage() {
    NewsPage.registerPage();
    MePage.registerPage();
    MessengerPage.registerPage();
    TrainingPage.registerPage();
  }

  static const String routeMessenger = "/messenger";
  static const String routeNews = "/news";
  static const String routeMe = "/me";

  MainPage({Key key, this.title}) : super(key: key);
  String title;
  MainTab pageIndex = MainTab.News;

  @override
  _MyHomePageState createState() => new _MyHomePageState();

  Map<MainTab, BasePage> pages = new Map();

  Widget getTabPageView() {
    BasePage cachedPage = pages[pageIndex];
    if (cachedPage != null) {
      return cachedPage;
    }
    switch (pageIndex) {
      case MainTab.News:
        cachedPage = new NewsPage(pageIndex);
        break;
      case MainTab.Me:
        cachedPage = new MePage(pageIndex);
        break;
      case MainTab.Messenger:
        cachedPage = new MessengerPage(pageIndex);
        break;
      case MainTab.Training:
        cachedPage = new TrainingPage(pageIndex);
        break;
      default:
        cachedPage = new NewsPage(pageIndex);
    }
    pages[pageIndex] = cachedPage;
    return cachedPage;
  }
}

class _MyHomePageState extends State<MainPage>
    implements ICustomBottomNavigationBar {
  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationBar bottomNavigationBar =
        new CustomBottomNavigationBar(
            currentTab: widget.pageIndex.index, callback: this);

    BasePage page = widget.getTabPageView();
    return new Scaffold(
      backgroundColor: new Color(0xFFE0E0E4),
      appBar: new AppBar(
        title: new Text(page.navTitle),
      ),
      bottomNavigationBar: bottomNavigationBar,
      // Assigning our navBar to the Scaffold's bottomNavigationBar property.
      body: new Center(
        child: page,
      ),
    );
  }

  @override
  void tabSelected(int index, {String title}) {
    print('selected: $index');

//    LoadingView loadingView = new LoadingView(context);
//    Future<String> dialogValue =  showDialog(context: context,barrierDismissible: true, builder:(context)=> loadingView);
//    dialogValue.then((String value) {
//      print('Dialog Close: ${value}');
//      loadingView = null;
//    });
//
//    DataFacade.shareInstance().loadingTopNews(dataListener:new IDataRequestLister<String>( start: () {
//    },success: (r) {
//      print('Result: ${r}');
//        loadingView?.hidden();
//    },failed: (e) {
//      loadingView?.hidden();
//    }));

    setState(() {
      widget.pageIndex = MainTab.values[index];
    });

  }
}
