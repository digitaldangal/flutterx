import 'package:flutterx/data/support/data_request_lister.dart';
import 'package:flutterx/domain/repository/networking/networking_manager.dart';
import 'dart:convert';//json

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
          jsonObjs.forEach((e){
            Map<String, dynamic> objMap = e as Map<String, dynamic>;
            _datafacdeLog(" item:: ${e as Map<String, dynamic>}");
            _datafacdeLog(" itemType:: ${e.runtimeType}");
            _datafacdeLog(" coverUrl:: ${objMap['coverUrl']}");
          });
    }, handleFailed: (exception) {
      _datafacdeLog(" Failed: $exception");
    }));
  }

  static void _datafacdeLog(String log) {
    print("Datafacade:: $log");
  }
}
