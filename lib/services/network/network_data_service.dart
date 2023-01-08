import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:sirialization/services/logger/logger.dart';

abstract class NetwrokDataService<T> {
  Future<http.Response> callApiWithErrorParser(Future<http.Response> api) async {
    try {
      http.Response response = await api;
      if (response.statusCode != HttpStatus.ok) {
        return response;
      }

      return response;
    } catch (e) {
      Logger.log(e);
      throw 'http exception';
    }
  }
}
