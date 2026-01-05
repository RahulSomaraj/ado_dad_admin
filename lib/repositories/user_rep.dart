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
      print('Error>>>>>>>>>:$e');
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
        // Backend expects 'type' for user type, not 'userType'
        'type': user.userType,
      };

      // Include countryCode if it's provided
      if (user.countryCode != null && user.countryCode!.isNotEmpty) {
        updateData['countryCode'] = user.countryCode;
      }

      // Only include profilePic if it's not null, not empty, and not a default placeholder
      if (user.profilePic != null &&
          user.profilePic!.isNotEmpty &&
          user.profilePic != 'default-profile-pic-url' &&
          user.profilePic!.startsWith('http')) {
        updateData['profilePic'] = user.profilePic;
      }

      // Include password only if it's provided (for password changes)
      if (user.password != null && user.password!.isNotEmpty) {
        updateData['password'] = user.password;
      }

      // Debug logging to see what's being sent
      print('🔍 Update User Data: $updateData');
      print('🔍 Profile Pic Value: "${user.profilePic}"');
      print('🔍 Profile Pic Included: ${updateData.containsKey('profilePic')}');
      print('🔍 User ID: ${user.id}');

      final response = await _dio.put('/users/${user.id}', data: updateData);

      print('🔍 Update Response Status: ${response.statusCode}');
      print('🔍 Update Response Data: ${response.data}');

      if (response.statusCode == 200) {
        print('✅ User update successful');
      } else {
        print('❌ User update failed with status: ${response.statusCode}');
        print('❌ Response message: ${response.data}');
        throw Exception("Failed to update user: ${response.data}");
      }
    } on DioException catch (e) {
      print('❌ DioException in updateUser:');
      print('❌ Status Code: ${e.response?.statusCode}');
      print('❌ Response Data: ${e.response?.data}');
      print('❌ Error Message: ${e.message}');
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
      print(response.data);
      if (response.statusCode == 201) {
        return response.data['message'] ?? "User added successfully";
      } else {
        throw Exception("Failed to add user: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      print('Error: $e');
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
      // final fileName =
      //     'image_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
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

  /// Fetch user ads by user ID with pagination
  Future<UserAdsResponse> fetchUserAds({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      print('🌐 API Call: GET /ads/user/$userId');
      final response = await _dio.get('/ads/user/$userId', queryParameters: {
        'page': page,
        'limit': limit,
      });
      print('✅ API Response Status: ${response.statusCode}');
      print('📄 API Response Data: ${response.data}');
      print('📄 API Response Data Type: ${response.data.runtimeType}');
      print(
          '📄 API Response Data Keys: ${response.data is Map ? (response.data as Map).keys.toList() : 'Not a Map'}');

      if (response.data is Map) {
        final dataMap = response.data as Map;
        print('📄 Data field exists: ${dataMap.containsKey('data')}');
        if (dataMap.containsKey('data')) {
          print('📄 Data field type: ${dataMap['data'].runtimeType}');
          print(
              '📄 Data field length: ${dataMap['data'] is List ? (dataMap['data'] as List).length : 'Not a List'}');
        }
      }

      if (response.statusCode == 200) {
        try {
          print('🔄 Attempting to parse UserAdsResponse...');
          final result = UserAdsResponse.fromJson(response.data);
          print(
              '✅ Successfully parsed UserAdsResponse with ${result.data.length} ads');
          return result;
        } catch (e, stackTrace) {
          print('❌ Error parsing UserAdsResponse: $e');
          print('❌ Error type: ${e.runtimeType}');
          print('❌ Stack trace: $stackTrace');
          print('📄 Raw response data: ${response.data}');
          throw Exception("Error parsing ads data: $e");
        }
      } else {
        throw Exception("Failed to load user ads");
      }
    } on DioException catch (e) {
      print('Error fetching user ads: $e');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error in fetchUserAds: $e');
      throw Exception("Unexpected error: $e");
    }
  }
}
