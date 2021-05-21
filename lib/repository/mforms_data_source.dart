import 'package:mforms/model/models.dart';
import 'package:mforms/model/multi_response.dart';

abstract class MFormsDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<Token>> register(
      String name, String email, String password);
  Future<SingleResponse<User>> getUser();
  Future<MultiResponse<Group>> getAllGroups();
  Future<SingleResponse<Group>> subscribeGroup(String code);
  Future<MultiResponse<FormDynamic>> getAllForms();
  Future<SingleResponse<FormDynamic>> getForm(int id);
  Future<bool> saveToken(String token);
  Future<String?> getToken();
  Future<bool> removeSession();
}
