import 'package:ado_dad_admin/models/login_model.dart';

import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://uat.ado-dad.com'));
  // ..interceptors.add(LogInterceptor(
  //   request: true,
  //   requestBody: true,
  //   responseBody: true,
  //   error: true,
  // ));

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      print(response);

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      throw Exception('Login error: ${e.toString()}');
    }
  }
}
