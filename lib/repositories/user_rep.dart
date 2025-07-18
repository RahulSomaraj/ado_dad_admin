import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio;

  UserRepository() : _dio = ApiService().dio;

  Future<UserResponse> fetchAllUsers(
      {int? page, int? limit, String? searchQuery}) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load users");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response = await _dio.delete('/users/$userId');

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to delete user");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      final response = await _dio.put('/users/${user.id}', data: {
        'name': user.name,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
      });

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to update user");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<String> createUser(UserModel userData) async {
    try {
      final response = await _dio.post(
        "/users",
        data: userData.toJson(),
      );
      print(response.data);
      if (response.statusCode == 201) {
        return response.data['message'] ?? "User added successfully";
      } else {
        throw Exception("Failed to add user: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message'] ?? "API error occurred");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
