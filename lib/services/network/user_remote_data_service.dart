import 'dart:convert';

import 'package:sirialization/global/constants.dart';
import 'package:sirialization/models/user.dart';
import 'package:sirialization/services/network/network_data_service.dart';
import 'package:http/http.dart' as http;

class UserRemoteSourceDataService extends NetwrokDataService {
  final method = 'users';
  Future<List<User>> readAllUser() {
    final endpoint = '${Constants.baseUrl}/$method';

    var apiCall = http.get(Uri.parse(endpoint));

    try {
      return callApiWithErrorParser(apiCall).then((response) => _parseAlluserResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  Future<User> findUser(int id) {
    final endpoint = '${Constants.baseUrl}/$method/$id';
    var apiCall = http.get(Uri.parse(endpoint));
    try {
      return callApiWithErrorParser(apiCall).then((response) => _parseFindUserResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<User> _parseAlluserResponse(http.Response response) {
    List<User> users = List.empty(growable: true);
    final json = jsonDecode(response.body);
    users.addAll((json['users'] as List<dynamic>).map((e) => User.fromJson(e)));
    return users;
  }

  User _parseFindUserResponse(http.Response response) {
    final json = jsonDecode(response.body);
    return User.fromJson(json);
  }
}
