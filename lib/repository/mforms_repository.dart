import 'package:mforms/model/token.dart';
import 'package:mforms/model/single_response.dart';
import 'package:mforms/repository/mforms_data_source.dart';
import 'package:mforms/repository/remote/remote_data_source.dart';

class MFormsRepository implements MFormsDataSource {
  late RemoteDataSource _remoteDataSource;

  MFormsRepository({required RemoteDataSource remoteDataSource})
      : this._remoteDataSource = remoteDataSource;

  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    return await _remoteDataSource.login(email, password);
  }
}
