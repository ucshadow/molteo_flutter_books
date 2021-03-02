import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'IApiHttpProvider.dart';
import 'app_exception.dart';

class ApiHttpImplementation implements IApiHttpProvider {
  Future<dynamic> get(String url, {withFakeHeaders: false}) async {
    print("GET: $url");
    if(withFakeHeaders) {
      return _get(url);
    }
    var responseJson;
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 20));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> _get(String url) async {
    var responseHtml;
    try {
      responseHtml = await http.get(url, headers: {
        HttpHeaders.userAgentHeader:
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0",
        HttpHeaders.hostHeader: "www.goodreads.com"
      }).timeout(const Duration(seconds: 20));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseHtml.body;
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String> headers}) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http
          .post(url, body: body, headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response =
      await http.put(url, body: body).timeout(const Duration(seconds: 20));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response =
      await http.delete(url).timeout(const Duration(seconds: 20));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      if(response.body.isEmpty) {
        return 200;
      }
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
