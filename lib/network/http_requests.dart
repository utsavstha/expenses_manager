import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../utils/exceptions.dart';

class HttpRequest {
  static final HttpRequest _httpRequest = HttpRequest._internal();
  late Dio dio;
  factory HttpRequest() {
    return _httpRequest;
  }

  HttpRequest._internal() {
    dio = Dio();
  }

  Future<dynamic> get(url) async {
    Response response;
    try {
      response = await dio.get(url);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return _response(response);
  }

  Future<dynamic> post(url, Map param) async {
    Response response;
    try {
      response = await dio.post(url, data: param);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return _response(response);
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data);
      case 401:
      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
