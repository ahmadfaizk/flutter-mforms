import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<bool> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  Future<bool> removeSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
