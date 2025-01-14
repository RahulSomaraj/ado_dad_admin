import 'dart:convert';

import 'package:ado_dad_admin/core/model/user_model.dart';
import 'package:ado_dad_admin/core/model/user_model_pagination.dart';
import 'package:ado_dad_admin/core/network/user_dio_client.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final DioClient dioClient;

  UserRepository({required this.dioClient});

  // Fetch Users with optional pagination
  Future<UserListPagination> fetchUsers({int page = 1, int limit = 10}) async {
    try {
      final response = await dioClient.get('/users', queryParameters: {
        'page': page,
        'limit': limit,
      });

      // Deserialize response into UserListPagination
      return UserListPagination.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.statusCode}');
        print('DioException Data: ${e.response?.data}');
      } else {
        print(e);
        print('Unknown Exception: $e');
      }

      throw Exception('Failed to load users');
    }
  }

  // Fetch User by ID
  Future<UserModel> fetchUserById(String userId) async {
    try {
      final response = await dioClient.get('/users/$userId'); // GET /users/{id}
      return UserModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.statusCode}');
        print('DioException Data: ${e.response?.data}');
      } else {
        print(e);
        print('Unknown Exception: $e');
      }

      throw Exception('Failed to fetch user by ID');
    }
  }

  // Create User
  Future<UserModel> createUser(Map<String, dynamic> data) async {
    try {
      final response = await dioClient.post('/users', data); // POST /users
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }

  // Update User
  Future<UserModel> updateUser(int userId, Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient.put('/users/$userId', data); // PUT /users/{id}
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  // Delete User
  Future<void> deleteUser(int userId) async {
    try {
      await dioClient.delete('/users/$userId'); // DELETE /users/{id}
    } catch (e) {
      throw Exception('Failed to delete user');
    }
  }
}
