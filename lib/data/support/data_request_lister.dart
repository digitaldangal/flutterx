import 'package:flutterx/data/support/data_exception.dart';

abstract class IDataRequestLister<T> {
  void start();

  void success(T result);

  void failed(DataException exception);
}
