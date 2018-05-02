import 'dart:convert';

import 'package:flutterx/domain/repository/networking/http_constants.dart';
import 'package:http/http.dart' as Http;

typedef void HandleNetworkingSuccess(String jsonString);
typedef void HandleNetworkingFailed(NetworkingException exception);

/**
 * defalut response handle logic:
 * {
 *    code : 200,
 *    result:{
 *
 *    }
 * }
 */
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
          handleSuccess(json.encode(jsonObj['result']));
        }
      } else {
        if (handleFailed != null) {
          handleFailed(new NetworkingException(
            json.encode(jsonObj['result']),
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

typedef bool ResponseSuccessFlag(Map<String, dynamic> rootObjJson);
/**
 * get the main result exclude code
 */
typedef String ResponseMainBody(Map<String, dynamic> rootObjJson);
class IDataConfigurationDisposeListener extends IDataDisposeListener {
  ResponseSuccessFlag successFlag;
  ResponseMainBody mainBody;

  IDataConfigurationDisposeListener(
      {HandleNetworkingSuccess handleSuccess,
      HandleNetworkingFailed handleFailed,
      this.successFlag,
      this.mainBody})
      : super(handleSuccess: handleSuccess, handleFailed: handleFailed);

  void onSuccess(String responseObj) {
    if (this.successFlag != null && this.mainBody != null) {
      try {
        Map<String, dynamic> jsonObj = json.decode(responseObj);

        if (this.successFlag(jsonObj)) {
          _networkLog("json: $jsonObj");
          if (handleSuccess != null) {
            handleSuccess(this.mainBody(jsonObj));
          }
        } else {
          if (handleFailed != null) {
            handleFailed(new NetworkingException(
              this.mainBody(jsonObj),
              code: HttpConstants.FAILED,
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
    } else {
      super.onSuccess(responseObj);
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
    String apiUrl = url;
    if (!url.startsWith('http')) {
      apiUrl = '${API_ROOT_URL}${url}';
    }
    _networkLog("---------------------$apiUrl-------------------");
    Http
        .get(apiUrl, headers: headers)
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
    String apiUrl = url;
    if (!url.startsWith('http:')) {
      apiUrl = '${API_ROOT_URL}${url}';
    }
    _networkLog("---------------------$apiUrl-------------------");
    Http
        .post(apiUrl, headers: headers, body: body, encoding: encoding)
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

  static void loadingTopNews(IDataConfigurationDisposeListener callBack) {
    _getRequest(
        API_NEWS_TOP_URL,
        lister: callBack);
  }
}

void _networkLog(String log) {
  print("Network: $log");
}
