import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mforms/model/form_data.dart';
import 'package:mforms/model/models.dart';
import 'package:mforms/model/multi_response.dart';
import 'package:mforms/model/single_response.dart';
import 'package:mforms/model/token.dart';

class RemoteDataSource {
  final String _baseUrl = 'http://192.168.56.1:8000/api/v1';
  final Client _client;

  const RemoteDataSource({required Client client}) : _client = client;

  Future<SingleResponse<Token>> login(String email, String password) async {
    Uri url = Uri.parse("$_baseUrl/login");
    var result = await _client.post(
      url,
      body: {"email": email, "password": password},
    );
    return SingleResponse<Token>.fromJson(
      json.decode(result.body),
      (json) => Token.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<SingleResponse<Token>> register(
    String name,
    String email,
    String password,
  ) async {
    Uri url = Uri.parse("$_baseUrl/register");
    var result = await _client.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    return SingleResponse<Token>.fromJson(
      json.decode(result.body),
      (json) => Token.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<SingleResponse<User>> getUser(String? token) async {
    Uri url = Uri.parse("$_baseUrl/user");
    var result = await _client
        .get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    return SingleResponse<User>.fromJson(
      json.decode(result.body),
      (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MultiResponse<Group>> getAllGroups(String? token) async {
    Uri url = Uri.parse("$_baseUrl/group");
    var result = await _client
        .get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    return MultiResponse<Group>.fromJson(
      json.decode(result.body),
      (json) => Group.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<SingleResponse<Group>> subscribeGroup(
    String? token,
    String code,
  ) async {
    Uri url = Uri.parse("$_baseUrl/group");
    var result = await _client.post(
      url,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      body: {'code': code},
    );
    return SingleResponse<Group>.fromJson(
      json.decode(result.body),
      (json) => Group.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MultiResponse<FormDynamic>> getAllForms(String? token) async {
    Uri url = Uri.parse("$_baseUrl/form");
    var result = await _client
        .get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    return MultiResponse<FormDynamic>.fromJson(
      json.decode(result.body),
      (json) => FormDynamic.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<SingleResponse<FormDynamic>> getForm(String? token, int id) async {
    Uri url = Uri.parse("$_baseUrl/form/$id");
    var result = await _client
        .get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    return SingleResponse<FormDynamic>.fromJson(
      json.decode(result.body),
      (json) => FormDynamic.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<SingleResponse<FormDynamic>> submitForm(
      String? token, int id, List<FormData> data) async {
    Uri url = Uri.parse("$_baseUrl/form/$id");
    var body = data.map((e) => e.toJson()).toList();
    var result = await _client.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(<String, dynamic>{"data": body}),
    );
    print(result.body);
    return SingleResponse<FormDynamic>.fromJson(
      json.decode(result.body),
      (json) => FormDynamic.fromJson(json as Map<String, dynamic>),
    );
  }
}
