import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


final _httpClient = new HttpClient();

Future<String> getRequest(Uri uri) async {
  var request = await _httpClient.getUrl(uri);
  var response = await request.close();

  return response.transform(utf8.decoder).join();
}

Future<String> postRequest(Uri uri) async {
  var request = await _httpClient.postUrl(uri);
  var response = await request.close();

  return response.transform(utf8.decoder).join();
}

