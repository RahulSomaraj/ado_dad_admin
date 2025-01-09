import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _refreshtokenKey = 'refresh_token';

  // Save token to local storage
  Future<void> saveToken(String token, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_refreshtokenKey, refreshToken);
  }

  // Retrieve token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Retrieve token
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshtokenKey);
  }

  // Remove token (for logout)
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshtokenKey);
  }

  // Check if token exists
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
