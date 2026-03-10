import 'dart:typed_data';

import 'package:ado_dad_admin/models/notification_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository() : _dio = ApiService().dio;

  Future<String?> uploadImageToS3(Uint8List fileBytes, String label) async {
    try {
      final mimeType = lookupMimeType('image.jpg', headerBytes: fileBytes);
      final fileExtension = mimeType?.split('/').last ?? 'jpg';
      final fileName =
          '${label}_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

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

  Future<String> sendBroadcastNotification(
    AdminBroadcastNotificationModel notificationData,
  ) async {
    try {
      final data = notificationData.toJson();

      final response = await _dio.post(
        "/notifications/send",
        data: data,
      );

      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'] ?? "Notification sent successfully";
      } else {
        throw Exception(
          "Failed to send notification: ${response.statusMessage}",
        );
      }
    } on DioException catch (e) {
      print("Dio Error: $e");

      if (e.response != null) {
        throw Exception(
          e.response!.data['message'] ?? "API error occurred",
        );
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<NotificationListResponse> fetchNotifications({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        "/notifications",
        queryParameters: {
          "page": page,
          "limit": limit,
        },
      );

      if (response.statusCode == 200) {
        return NotificationListResponse.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception("Failed to fetch notifications");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
