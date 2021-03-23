import 'dart:convert';

import 'package:http/http.dart';
import 'package:mforms/model/single_response.dart';
import 'package:mforms/model/token.dart';

class RemoteDataSource {
  final String _baseUrl = 'http://192.168.10.4:8000/api/v1';
  final Client _httpClient;

  const RemoteDataSource({required Client httpClient})
      : _httpClient = httpClient;

  Future<SingleResponse<Token>> login(String email, String password) async {
    Uri url = Uri.parse("$_baseUrl/login");
    var result = await _httpClient
        .post(url, body: {"email": email, "password": password});
    var object = json.decode(result.body);
    if (object['data'] != null) {
      object['data'] = Token.fromJson(object['data']);
    }

    return SingleResponse.fromJson(object);
  }
}
