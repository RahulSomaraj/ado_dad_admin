import 'dart:typed_data';
import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class BannerRepository {
  final Dio _dio;

  BannerRepository() : _dio = ApiService().dio;

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

  Future<BannerUploadRequest> saveBannerToDB(
      BannerUploadRequest request) async {
    try {
      print('🔄 Saving banner to database...');
      print('📄 Banner data: ${request.toJson()}');

      final response = await _dio.post('/banners', data: request.toJson());

      print('✅ Banner saved successfully: ${response.statusCode}');
      print('📄 Response data: ${response.data}');

      // Parse the response to get the created banner with ID
      final createdBanner = BannerUploadRequest.fromJson(response.data);
      print('🆔 Created banner ID: ${createdBanner.id}');

      return createdBanner;
    } on DioException catch (e) {
      print('❌ DioException in saveBannerToDB: $e');
      print('❌ DioException type: ${e.type}');
      print('❌ DioException response: ${e.response}');
      print('❌ DioException status code: ${e.response?.statusCode}');
      print('❌ DioException message: ${e.message}');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error in saveBannerToDB: $e');
      throw Exception('DB save failed: $e');
    }
  }

  Future<BannerResponse> fetchAllBanners(
      {int? page, int? limit, String? searchQuery}) async {
    try {
      final response = await _dio.get(
        '/banners',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': searchQuery,
        },
      );
      print('banner response:..........$response');
      print('banner response:..........${response.statusCode}');
      if (response.statusCode == 200) {
        return BannerResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load banners");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }

  Future<void> updateBanner(BannerUploadRequest banner) async {
    try {
      print('🔄 Updating banner with ID: ${banner.id}');
      print('🔄 Banner ID type: ${banner.id.runtimeType}');
      print('🔄 Banner ID value: "${banner.id}"');

      // Use the banner's toUpdateJson method (excludes _id field)
      final updateData = banner.toUpdateJson();

      print('📄 Update data: $updateData');
      print('🌐 Making PUT request to: /banners/${banner.id}');

      final response = await _dio.put(
        '/banners/${banner.id}',
        data: updateData,
      );

      print('✅ Banner update successful: ${response.statusCode}');
      print('📄 Response data: ${response.data}');
    } on DioException catch (e) {
      print('❌ DioException in updateBanner: $e');
      print('❌ DioException type: ${e.type}');
      print('❌ DioException response: ${e.response}');
      print('❌ DioException status code: ${e.response?.statusCode}');
      print('❌ DioException message: ${e.message}');
      print('❌ DioException request options: ${e.requestOptions}');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error in updateBanner: $e');
      throw Exception('Banner update failed: $e');
    }
  }

  Future<void> deleteBanner(String bannerId) async {
    try {
      final response = await _dio.delete('/banners/$bannerId');

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to delete banner");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }
}
