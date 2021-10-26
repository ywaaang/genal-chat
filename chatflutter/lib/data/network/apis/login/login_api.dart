import 'dart:async';

import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/models/chat/chat_list.dart';

class LoginApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  LoginApi(this._dioClient, this._restClient);

  /// Returns login response
  Future<dynamic> login(req) async {
    try {
      final res = await _dioClient.post(Endpoints.login, data: req);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
