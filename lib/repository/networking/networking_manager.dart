import 'dart:convert';

import 'package:flutterx/repository/networking/http_constants.dart';
import 'package:http/http.dart' as Http;

typedef void HandleNetworkingSuccess(dynamic result);
typedef void HandleNetworkingFailed(NetworkingException exception);

class IDataDisposeListener {
  HandleNetworkingSuccess handleSuccess;
  HandleNetworkingFailed handleFailed;

  IDataDisposeListener({this.handleSuccess, this.handleFailed});

  void onSuccess(String responseObj) {
    try {
      Map<String, dynamic> jsonObj = json.decode(responseObj);
      int code = jsonObj['code'];
      int ts = jsonObj['ts'];
      if (code == HttpConstants.OK) {
        _networkLog("json: $jsonObj");
        if (handleSuccess != null) {
          handleSuccess((jsonObj['result'] as String));
        }
      } else {
        if (handleFailed != null) {
          handleFailed(new NetworkingException(
            jsonObj['result'],
            code: code,
          ));
        }
      }
    } catch (e) {
      _networkLog("Exception: $e");
      if (handleFailed != null) {
        handleFailed(
            new NetworkingException(e.toString(), code: HttpConstants.ERROR));
      }
    } finally {}
  }

  /**
   * handle failed networking response
   */
  void onFailed(NetworkingException exception) {
    if (handleFailed != null) {
      handleFailed(exception);
    }
  }
}

class NetworkingException implements Exception {
  int code = HttpConstants.OK;

  final String msg;

  NetworkingException(this.msg, {this.code});

  @override
  String toString() {
    return 'NetworkingException:[$code]:: $msg';
  }
}

class NetworkingManager {
  static void _getRequest(String url,
      {Map<String, String> headers, IDataDisposeListener lister}) async {
    _networkLog("---------------------WEBAPI GET-------------------");
    _networkLog("---------------------$url-------------------");
    Http
        .get('${API_ROOT_URL}${url}', headers: headers)
        .timeout(new Duration(seconds: API_TIMEOUT_SECOND))
        .then((Http.Response response) {
      _networkLog("---------------------WEBAPI-------------------");
      _networkLog("URL: ${response.request.url}");
      _networkLog("STATUSCODE: ${response.statusCode}");
      _networkLog("HEADER: ${response.headers}");
      _networkLog("METHOD: ${response.request.method}");
      _networkLog("RESPONSE: ${response.body}");

      if (response.statusCode == HttpConstants.OK) {
        lister?.onSuccess(response.body);
      } else {
        lister?.onFailed(
            new NetworkingException(response.body, code: response.statusCode));
      }
    }).catchError((handleError) {
      _networkLog("---------------------WEBAPI ERROR-------------------");

      _networkLog("---------------------$handleError-------------------");
      lister?.onFailed(new NetworkingException(handleError.toString(),
          code: HttpConstants.ERROR));
    }).whenComplete(() {
      //finally
      _networkLog("---------------------WEBAPI DONE-------------------");
    });
  }

  static void _postRequest(String url,
      {Map<String, String> headers,
      dynamic body,
      Encoding encoding,
      IDataDisposeListener lister}) {
    _networkLog("---------------------WEBAPI POST-------------------");
    _networkLog("---------------------$url-------------------");
    Http
        .post(API_ROOT_URL + url,
            headers: headers, body: body, encoding: encoding)
        .then((Http.Response response) {
      _networkLog("---------------------WEBAPI-------------------");
      _networkLog("URL: ${response.request.url}");
      _networkLog("STATUSCODE: ${response.statusCode}");
      _networkLog("HEADER: ${response.headers}");
      _networkLog("METHOD: ${response.request.method}");
      _networkLog("RESPONSE: ${response.body}");
      print("---------------------WEBAPI-------------------");

      if (response.statusCode == HttpConstants.OK) {
        lister?.onSuccess(response.body);
      } else {
        lister?.onFailed(
            new NetworkingException(response.body, code: response.statusCode));
      }
    }).catchError((Error handleError) {
      _networkLog("---------------------WEBAPI ERROR-------------------");
      _networkLog("---------------------$handleError-------------------");
      lister?.onFailed(new NetworkingException(handleError.toString(),
          code: HttpConstants.ERROR));
    }).whenComplete(() {
      //finally
      _networkLog("---------------------WEBAPI DONE-------------------");
    });
  }

  static void loadingHomeChallenges(IDataDisposeListener callBack) {
    _getRequest(API_URL_CHALLENGES, lister: callBack);
  }
}

void _networkLog(String log) {
  print("Network: $log");
}
