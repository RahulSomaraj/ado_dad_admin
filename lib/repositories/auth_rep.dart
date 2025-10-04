import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

// Custom exception classes for different login error types
class InvalidCredentialsException implements Exception {
  final String message;
  InvalidCredentialsException(this.message);

  @override
  String toString() => message;
}

class UserTypeRestrictedException implements Exception {
  final String message;
  UserTypeRestrictedException(this.message);

  @override
  String toString() => message;
}

class AuthRepository {
  final Dio _dio = ApiService().dio;

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 201) {
        final loginResponse = LoginResponse.fromJson(response.data);

        // Debug logging for login response
        print('🔍 Auth: Login response received');
        print('🔍 Auth: Profile Pic: "${loginResponse.profilePic}"');

        // Allow only Admin & Super Admin
        final allowedTypes = ['AD', 'SA'];
        if (!allowedTypes.contains(loginResponse.userType)) {
          throw UserTypeRestrictedException(
              "Access Denied: Only Admin and Super Admin can log in.");
        }
        await saveLoginResponse(loginResponse);
        print('🔍 Auth: Login response saved to SharedPreferences');
        return loginResponse;
      } else {
        throw InvalidCredentialsException("Invalid Username or Password");
      }
    } on DioException catch (e) {
      // Handle specific HTTP status codes for invalid credentials
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        throw InvalidCredentialsException("Invalid Username or Password");
      }
      throw InvalidCredentialsException("Invalid Username or Password");
    } catch (e) {
      if (e is InvalidCredentialsException ||
          e is UserTypeRestrictedException) {
        rethrow; // Re-throw our custom exceptions
      }
      throw InvalidCredentialsException("Invalid Username or Password");
    }
  }
}
