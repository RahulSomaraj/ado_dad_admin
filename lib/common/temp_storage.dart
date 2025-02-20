import 'package:ado_dad_admin/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPreferences? _prefs;

  SharedPrefs._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) => _prefs?.getString(key);

  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }
}

Future<void> saveLoginResponse(LoginResponse loginResponse) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', loginResponse.token);
  await prefs.setString('refreshToken', loginResponse.refreshToken);
  await prefs.setString('email', loginResponse.email);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('refreshToken');
}

Future<String?> getUserName() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('name');
}

Future<String?> getUserEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<String?> getUserProfilePicture() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('profilePicture');
}

Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
