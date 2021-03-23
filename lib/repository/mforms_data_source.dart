import 'package:mforms/model/models.dart';

abstract class MFormsDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
}
