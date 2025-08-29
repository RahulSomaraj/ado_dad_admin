import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/models/login_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

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
        // Allow only Amin & Super Admin
        final allowedTypes = ['AD', 'SA'];
        if (!allowedTypes.contains(loginResponse.userType)) {
          throw Exception(
              "Access Denied: Only Admin and Super Admin can log in.");
        }
        await saveLoginResponse(loginResponse);
        return loginResponse;
      } else {
        throw Exception("❌ Login failed: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("❌ Unexpected error: ${e.toString()}");
    }
  }
}
