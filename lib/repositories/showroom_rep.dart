import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class ShowroomRepository {
  final Dio _dio;

  ShowroomRepository() : _dio = ApiService().dio;

  Future<UserResponse> fetchAllShowroom(
      {int? page, int? limit, String? userType, String? searchQuery}) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          'page': page,
          'limit': limit,
          'type': userType,
          'search': searchQuery,
        },
      );
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load Showroom: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  Future<String> createShowroom(UserModel showroomData) async {
    try {
      final response = await _dio.post(
        "/users",
        data: showroomData.toJson(),
      );
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

  Future<void> updateShowroom(UserModel showroomuser) async {
    try {
      final response = await _dio.put('/users/${showroomuser.id}', data: {
        'name': showroomuser.name,
        'email': showroomuser.email,
        'phoneNumber': showroomuser.phoneNumber,
      });

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to update user");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }
}
