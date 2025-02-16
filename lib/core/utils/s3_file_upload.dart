import 'dart:typed_data';
import 'package:dio/dio.dart';

class S3UploadService {
  final Dio dio;

  S3UploadService({Dio? dio}) : dio = dio ?? Dio();

  /// Uploads a file to S3 using a pre-signed URL.
  ///
  /// [fileData]: The file's byte data.
  /// [fileName]: The desired file name (e.g. "image_1.jpg").
  /// [fileType]: The MIME type of the file (default is "image/jpeg").
  ///
  /// Returns the public URL of the uploaded file.
  Future<String> uploadFile({
    required Uint8List fileData,
    required String fileName,
    String fileType = "image/jpeg",
  }) async {
    // Step 1: Request a pre-signed URL from your backend.
    final response = await dio.get(
      'upload/presigned-url', // Replace with your actual endpoint
      queryParameters: {
        'fileName': fileName,
        'fileType': fileType,
      },
    );

    if (response.statusCode == 200) {
      final presignedUrl = response.data['url'];

      // Step 2: Upload the file to S3 using the pre-signed URL.
      await dio.put(
        presignedUrl,
        data: fileData,
        options: Options(
          headers: {'Content-Type': fileType},
        ),
      );

      // Return the public URL of the uploaded file (assumes the public URL is the presigned URL without query parameters)
      return presignedUrl.split('?')[0];
    } else {
      throw Exception("Failed to obtain a pre-signed URL");
    }
  }
}
