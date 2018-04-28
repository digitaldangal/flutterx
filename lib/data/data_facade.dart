import 'dart:convert';

import 'package:flutterx/data/support/data_exception.dart';
import 'package:flutterx/domain/repository/networking/networking_manager.dart'; //json

typedef void Start();
typedef void Success<T>(T result);
typedef void Failed(DataException exception);

class IDataRequestLister<T>{
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

  static void _datafacdeLog(String log) {
    print("Datafacade:: $log");
  }
}
