import 'package:ado_dad_admin/common/data_storage.dart'; // SharedPrefs storage
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://uat.ado-dad.com')) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getToken(); // Retrieve stored access token
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            print("401 Unauthorized detected. Attempting token refresh...");

            final newToken = await _refreshToken();
            if (newToken != null) {
              // Retry the failed request with the new token
              e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
              final retryResponse = await _dio.fetch(e.requestOptions);
              return handler.resolve(retryResponse);
            } else {
              print("Refresh token failed. Logging out...");
              await logout();
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 201) {
        final loginResponse = LoginResponse.fromJson(response.data);

        // Save tokens securely
        await saveLoginResponse(loginResponse);

        return loginResponse;
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception('Login error: ${e.toString()}');
    }
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        print("No refresh token found. User must re-login.");
        return null;
      }

      final response = await _dio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        final newAccessToken = response.data['token'];
        await SharedPrefs().setString('token', newAccessToken);
        print("Token refreshed successfully.");
        return newAccessToken;
      } else {
        print("Token refresh failed. Logging out...");
        await logout();
        return null;
      }
    } catch (e) {
      print("Refresh token request failed. Logging out...");
      await logout();
      return null;
    }
  }

  Future<void> logout() async {
    print("xxxxxxxxxxxxxx...");

    await clearUserData(); // Clear stored login data
  }
}
