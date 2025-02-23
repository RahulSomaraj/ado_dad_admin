import 'package:ado_dad_admin/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  SharedPreferences? _prefs;

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Generic getter for Strings
  String? getString(String key) => _prefs?.getString(key);

  /// Generic setter for Strings
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Remove a specific key
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all stored preferences
  Future<void> clear() async {
    await _prefs?.clear();
  }
}

/// Save login response data
Future<void> saveLoginResponse(LoginResponse loginResponse) async {
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.setString('token', loginResponse.token);
  await sharedPrefs.setString('name', loginResponse.userName);
  await sharedPrefs.setString('refreshToken', loginResponse.refreshToken);
  await sharedPrefs.setString('userType', loginResponse.userType);
  await sharedPrefs.setString('email', loginResponse.email);
}

/// Retrieve stored token
Future<String?> getToken() async {
  return SharedPrefs().getString('token');
}

/// Retrieve stored refresh token
Future<String?> getRefreshToken() async {
  return SharedPrefs().getString('refreshToken');
}

/// Retrieve stored username
Future<String?> getUserName() async {
  return SharedPrefs().getString('name');
}

/// Retrieve stored user email
Future<String?> getUserEmail() async {
  return SharedPrefs().getString('email');
}

/// Retrieve stored user type
Future<String?> getUserUserType() async {
  return SharedPrefs().getString('userType');
}

/// Retrieve stored profile picture (if applicable)
Future<String?> getUserProfilePicture() async {
  return SharedPrefs().getString('profilePicture');
}

/// Clear user-specific stored data
Future<void> clearUserData() async {
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.remove('token');
  await sharedPrefs.remove('refreshToken');
  await sharedPrefs.remove('name');
  await sharedPrefs.remove('userType');
  await sharedPrefs.remove('email');
  await sharedPrefs.remove('profilePicture');
}
