import 'package:flutterx/repository/networking/http_constants.dart';

/**
 * Custom  Exception
 */
class DataException implements Exception {
  int code = HttpConstants.OK;

  final String msg;

  DataException(this.msg, {this.code});

  @override
  String toString() {
    return 'DataException:[$code]:: $msg';
  }
}
