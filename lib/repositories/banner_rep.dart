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

  Future<BannerUploadRequest> saveBannerToDB(
      BannerUploadRequest request) async {
    try {
      final response = await _dio.post('/banners', data: request.toJson());
      final createdBanner = BannerUploadRequest.fromJson(response.data);
      return createdBanner;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
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

      if (response.statusCode == 200) {
        try {
          final responseData = response.data;
          Map<String, dynamic> jsonData;

          if (responseData is Map<String, dynamic>) {
            dynamic safeGet(Map<String, dynamic> map, List<String> keys,
                dynamic defaultValue) {
              for (var key in keys) {
                if (map.containsKey(key)) {
                  return map[key];
                }
              }
              return defaultValue;
            }

            if (responseData.containsKey('data')) {
              jsonData = {
                'banners': responseData['data'],
                'totalPages':
                    safeGet(responseData, ['totalPages', 'totalpages'], 1),
                'currentPage': safeGet(
                    responseData, ['currentPage', 'currentpage', 'page'], 1),
              };
            } else if (responseData.containsKey('banners')) {
              jsonData = responseData;
            } else if (responseData.containsKey('data') == false &&
                responseData is! List) {
              final listKey = responseData.keys.firstWhere(
                (key) => responseData[key] is List,
                orElse: () => '',
              );
              if (listKey.isNotEmpty) {
                jsonData = {
                  'banners': responseData[listKey],
                  'totalPages':
                      safeGet(responseData, ['totalPages', 'totalpages'], 1),
                  'currentPage': safeGet(
                      responseData, ['currentPage', 'currentpage', 'page'], 1),
                };
              } else {
                throw Exception('No banners array found in response');
              }
            } else {
              jsonData = responseData;
            }
          } else {
            throw Exception(
                'Unexpected response format: ${responseData.runtimeType}');
          }

          return BannerResponse.fromJson(jsonData);
        } catch (e) {
          rethrow;
        }
      } else {
        throw Exception("Failed to load banners: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Failed to fetch banners: $e");
    }
  }

  Future<void> updateBanner(BannerUploadRequest banner) async {
    try {
      final updateData = banner.toUpdateJson();
      await _dio.put(
        '/banners/${banner.id}',
        data: updateData,
      );
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
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
