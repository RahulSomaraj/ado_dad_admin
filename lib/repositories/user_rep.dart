import 'dart:typed_data';

import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

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

  Future<UserModel> fetchUserById(String userId) async {
    try {
      final response = await _dio.get('/users/$userId');

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load user");
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
      final Map<String, dynamic> updateData = {
        'name': user.name,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'type': user.userType,
      };

      if (user.countryCode != null && user.countryCode!.isNotEmpty) {
        updateData['countryCode'] = user.countryCode;
      }

      if (user.profilePic != null &&
          user.profilePic!.isNotEmpty &&
          user.profilePic != 'default-profile-pic-url' &&
          user.profilePic!.startsWith('http')) {
        updateData['profilePic'] = user.profilePic;
      }

      if (user.password != null && user.password!.isNotEmpty) {
        updateData['password'] = user.password;
      }

      final response = await _dio.put('/users/${user.id}', data: updateData);

      if (response.statusCode == 200) {
        // success
      } else {
        throw Exception("Failed to update user: ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<String> createUser(UserModel userData) async {
    try {
      final data = userData.toJson();
      final response = await _dio.post(
        "/users",
        data: data,
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

  Future<String?> uploadImageToS3(Uint8List fileBytes, String label) async {
    try {
      final mimeType = lookupMimeType('image.jpg', headerBytes: fileBytes);
      final fileExtension = mimeType?.split('/').last ?? 'jpg';
      final fileName = '$label.$fileExtension';

      final signedUrlResponse = await _dio.get(
        '/upload/presigned-url',
        queryParameters: {
          'fileName': fileName,
          'fileType': mimeType,
        },
      );
      final signedUrl = signedUrlResponse.data['url'];
      if (signedUrl == null) throw Exception('No signed URL received');

      final uploadResponse = await Dio().put(
        signedUrl,
        data: fileBytes,
        options: Options(headers: {
          'Content-Type': mimeType,
          'Content-Length': fileBytes.length.toString(),
        }),
      );
      if (uploadResponse.statusCode == 200 ||
          uploadResponse.statusCode == 204) {
        return signedUrl.split('?').first;
      } else {
        throw Exception('Upload failed: ${uploadResponse.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<UserAdsResponse> fetchUserAds({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get('/ads/user/$userId', queryParameters: {
        'page': page,
        'limit': limit,
      });

      if (response.statusCode == 200) {
        try {
          return UserAdsResponse.fromJson(response.data);
        } catch (e) {
          throw Exception("Error parsing ads data: $e");
        }
      } else {
        throw Exception("Failed to load user ads");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
