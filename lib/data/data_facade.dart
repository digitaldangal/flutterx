import 'dart:convert';

import 'package:flutterx/data/support/data_exception.dart';
import 'package:flutterx/domain/entity/news.dart';
import 'package:flutterx/domain/repository/networking/networking_manager.dart';

typedef void Start();
typedef void Success<T>(T result);
typedef void Failed(DataException exception);

class IDataRequestLister<T> {
  Start start;
  Success success;
  Failed failed;

  IDataRequestLister({this.start, this.success, this.failed});
}

class DataFacade {
  static DataFacade _instance = new DataFacade();

  static DataFacade shareInstance() {
    return _instance;
  }

  void loadingHomeChallenges({IDataRequestLister dataListener}) {
    NetworkingManager.loadingHomeChallenges(
        new IDataDisposeListener(handleSuccess: (resultStr) {
      _datafacdeLog(" Success:: $resultStr");
      List<dynamic> jsonObjs = json.decode(resultStr);
      jsonObjs.forEach((e) {
        Map<String, dynamic> objMap = e as Map<String, dynamic>;
        _datafacdeLog(" item:: ${e as Map<String, dynamic>}");
        _datafacdeLog(" itemType:: ${e.runtimeType}");
        _datafacdeLog(" coverUrl:: ${objMap['coverUrl']}");
      });

      dataListener?.success(resultStr);
    }, handleFailed: (exception) {
      _datafacdeLog(" Failed: $exception");
      dataListener?.failed(new DataException("Falied.."));
    }));
  }

  void loadingTopNews({IDataRequestLister dataListener}) {
    NetworkingManager.loadingTopNews(new IDataConfigurationDisposeListener(
        successFlag: (Map<String, dynamic> rootObjJson) {
      return (rootObjJson['status'] as String) == 'ok';
    }, mainBody: (Map<String, dynamic> rootObjJson) {
      return json.encode(rootObjJson['articles']);
    }, handleSuccess: (resultStr) {
      _datafacdeLog(" Success:: $resultStr");
      List<dynamic> jsonObjs = json.decode(resultStr);
      List<News> newsArray = new List();
      jsonObjs.forEach((e) {
        Map<String, dynamic> objMap = e as Map<String, dynamic>;
        News news = new News.fromJson(objMap);
        newsArray.add(news);
        _datafacdeLog(" item:: ${e as Map<String, dynamic>}");
        _datafacdeLog(" itemType:: ${e.runtimeType}");
      });
      dataListener?.success(newsArray);
    }, handleFailed: (exception) {
      _datafacdeLog(" Failed: $exception");
      dataListener?.failed(new DataException("Falied.."));
    }));
  }

  static void _datafacdeLog(String log) {
    print("Datafacade:: $log");
  }
}
