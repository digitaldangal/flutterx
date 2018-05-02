import 'package:flutter/material.dart';
import 'package:flutterx/data/data_facade.dart';
import 'package:flutterx/domain/entity/news.dart';
import 'package:flutterx/ui/base_page.dart';
import 'package:flutterx/ui/common.dart';
import 'package:flutterx/widgets/flutterx_loading_dialog.dart';

class NewsPage extends BasePage {
  List<News> news = new List();

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

  static void registerPage() {}
}

class _NewsState extends State<NewsPage> {
  static const Key contentKey = const Key('content');

  @override
  void initState() {
    super.initState();
    print('initState   page: $this');
    if (widget.news.length <= 0) {
      LoadingView loadingView = null; //new LoadingView(context);
//      Future<String> dialogValue = showDialog(
//          context: context,
//          barrierDismissible: true,
//          builder: (context) => loadingView);
//      dialogValue.then((String value) {
//        print('Dialog Close: ${value}');
//        loadingView = null;
//      });

      DataFacade.shareInstance().loadingTopNews(
          dataListener: new IDataRequestLister<String>(
              start: () {},
              success: (r) {
                print('Result: ${r}');

                setState(() {
                  widget.news.clear();
                  widget.news.addAll(r);
                });
                loadingView?.hidden();
              },
              failed: (e) {
                loadingView?.hidden();
              }));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scrollbar(
      key: contentKey,
      child: new ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        itemCount: widget.news.length,
        itemBuilder: (BuildContext context, int index) {
          var newsItem = widget.news[index];
          var useAlternateBackground = index % 2 == 0;
          Color color = Colors.blue;
          if (useAlternateBackground) {
            color = Colors.green;
          }

          Widget image = new SizedBox.fromSize(
              size: new Size(76.0, 76.0),
              child: new Image.network((newsItem.urlToImage != null
                  ? newsItem.urlToImage
                  : 'http://n.sinaimg.cn/edu/transform/500/w300h200/20180502/Tnro-fzyqqip6473001.jpg')));

          return new Column(
            children: <Widget>[
              new GestureDetector(
                onTap: () {},
                child: new Row(children: [
                  new Container(
                      padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                      color: Colors.transparent,
                      height: 76.0,
                      width:76.0,
                      child: image),
                  new Flexible(
                    child: new Text(
                      newsItem.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
              new Divider(
                height: 0.5,
                indent: 0.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
