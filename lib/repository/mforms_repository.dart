import 'package:mforms/model/form.dart';
import 'package:mforms/model/group.dart';
import 'package:mforms/model/multi_response.dart';
import 'package:mforms/model/token.dart';
import 'package:mforms/model/single_response.dart';
import 'package:mforms/model/user.dart';
import 'package:mforms/repository/local/local_data_source.dart';
import 'package:mforms/repository/mforms_data_source.dart';
import 'package:mforms/repository/remote/remote_data_source.dart';

class MFormsRepository implements MFormsDataSource {
  late RemoteDataSource _remoteDataSource;
  late LocalDataSource _localDataSource;

  MFormsRepository({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  }) {
    this._remoteDataSource = remoteDataSource;
    this._localDataSource = localDataSource;
  }

  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    return await _remoteDataSource.login(email, password);
  }

  @override
  Future<String?> getToken() async {
    return await _localDataSource.getToken();
  }

  @override
  Future<bool> removeSession() async {
    return await _localDataSource.removeSession();
  }

  @override
  Future<bool> saveToken(String token) async {
    return await _localDataSource.saveToken(token);
  }

  @override
  Future<SingleResponse<Token>> register(
      String name, String email, String password) async {
    return await _remoteDataSource.register(name, email, password);
  }

  @override
  Future<SingleResponse<User>> getUser() async {
    var token = await _localDataSource.getToken();
    return await _remoteDataSource.getUser(token);
  }

  @override
  Future<MultiResponse<Group>> getAllGroups() async {
    var token = await _localDataSource.getToken();
    return await _remoteDataSource.getAllGroups(token);
  }

  @override
  Future<SingleResponse<Group>> subscribeGroup(String code) async {
    var token = await _localDataSource.getToken();
    return await _remoteDataSource.subscribeGroup(token, code);
  }

  @override
  Future<MultiResponse<Form>> getAllForms() async {
    var token = await _localDataSource.getToken();
    return await _remoteDataSource.getAllForms(token);
  }

  @override
  Future<SingleResponse<Form>> getForm(int id) async {
    var token = await _localDataSource.getToken();
    throw await _remoteDataSource.getForm(token, id);
  }
}
