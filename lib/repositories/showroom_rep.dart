import 'dart:typed_data';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class ShowroomRepository {
  final Dio _dio;

  ShowroomRepository() : _dio = ApiService().dio;

  Future<UserResponse> fetchAllShowroom(
      {int? page, int? limit, String? userType, String? searchQuery}) async {
    try {
      // For SR users, try a different approach or handle permissions differently
      final response = await _dio.get(
        '/users',
        queryParameters: {
          'page': page,
          'limit': limit,
          'type': userType ?? 'SR',
          'search': searchQuery,
        },
      );
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load Showroom: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      // Handle specific error cases for SR users
      if (e.response?.statusCode == 403) {
        throw Exception(
            "Access denied: You don't have permission to view showrooms");
      } else if (e.response?.statusCode == 401) {
        throw Exception("Unauthorized: Please log in again");
      }
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  // Method to fetch current user's showroom information for SR users
  Future<UserResponse> fetchCurrentUserShowroom() async {
    try {
      final currentUserType = await getUserType();
      final currentUserName = await getUserName();

      if (currentUserType == 'SR') {
        // For SR users, try to fetch their own information
        final response = await _dio.get(
          '/users',
          queryParameters: {
            'page': 1,
            'limit': 1,
            'type': 'SR',
            'search': currentUserName ?? '',
          },
        );

        if (response.statusCode == 200) {
          return UserResponse.fromJson(response.data);
        } else {
          throw Exception(
              "Failed to load your showroom information: ${response.statusMessage}");
        }
      } else {
        // For admin users, fetch all showrooms
        return await fetchAllShowroom();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception(
            "Access denied: You don't have permission to view showroom information");
      } else if (e.response?.statusCode == 401) {
        throw Exception("Unauthorized: Please log in again");
      }
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
      final Map<String, dynamic> updateData = {
        'name': showroomuser.name,
        'email': showroomuser.email,
        'phoneNumber': showroomuser.phoneNumber,
        'type': showroomuser.userType,
      };

      // Only include profilePic if it's not null, not empty, and not a default placeholder
      if (showroomuser.profilePic != null &&
          showroomuser.profilePic!.isNotEmpty &&
          showroomuser.profilePic != 'default-profile-pic-url' &&
          showroomuser.profilePic!.startsWith('http')) {
        updateData['profilePic'] = showroomuser.profilePic;
      }

      final response =
          await _dio.put('/users/${showroomuser.id}', data: updateData);

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to update user");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<String?> uploadImageToS3(Uint8List fileBytes, String label) async {
    try {
      final mimeType = lookupMimeType('image.jpg', headerBytes: fileBytes);
      final fileExtension = mimeType?.split('/').last ?? 'jpg';
      final fileName = '$label.$fileExtension';

      // Step 1: Get presigned URL
      final signedUrlResponse = await _dio.get(
        '/upload/presigned-url',
        queryParameters: {
          'fileName': fileName,
          'fileType': mimeType,
        },
      );
      print('??????????????$signedUrlResponse?????????????????');
      final signedUrl = signedUrlResponse.data['url'];
      print('??????????????$signedUrl?????????????????');
      if (signedUrl == null) throw Exception('No signed URL received');

      // Step 2: Upload to S3
      final uploadResponse = await Dio().put(
        signedUrl,
        data: fileBytes,
        options: Options(headers: {
          'Content-Type': mimeType,
          'Content-Length': fileBytes.length.toString(),
        }),
      );
      print('##############${uploadResponse.statusCode}##############');
      if (uploadResponse.statusCode == 200 ||
          uploadResponse.statusCode == 204) {
        return signedUrl
            .split('?')
            .first; // ✅ Public URL (without query params)
      } else {
        throw Exception('Upload failed: ${uploadResponse.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error in uploadImageToS3: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
