import 'package:flutterx/data/support/data_request_lister.dart';
import 'package:flutterx/repository/networking/networking_manager.dart';

class DataFacade {
  static DataFacade _instance = new DataFacade();

  static DataFacade shareInstance() {
    return _instance;
  }

  void loadingHomeChallenges({IDataRequestLister dataListener}) {
    NetworkingManager.loadingHomeChallenges(
        new IDataDisposeListener(handleSuccess: (resultStr) {
      _datafacdeLog(" Success"+resultStr);
    }, handleFailed: (exception) {
      _datafacdeLog(" Failed $exception");
    }));
  }

  static void _datafacdeLog(String log) {
    print("Datafacade:: $log");
  }
}
