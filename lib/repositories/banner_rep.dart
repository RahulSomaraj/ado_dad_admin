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

  Future<void> saveBannerToDB(BannerUploadRequest request) async {
    try {
      await _dio.post('/banners', data: request.toJson());
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ DB save failed: $e');
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
      await _dio.put(
        '/banners/${banner.id}',
        data: banner.toJson(),
      );
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Banner update failed: $e');
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
