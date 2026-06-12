import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class AdsRepository {
  final Dio _dio = ApiService().dio;

  /// Fetch all ads with pagination
  Future<UserAdsResponse> fetchAllAds({
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      // final response = await _dio.post('/v2/ads/list', data: {
      //   'page': page,
      //   'limit': limit,
      //   'search': searchQuery,
      // });
      final response = await _dio.get('/ads/admin/all', queryParameters: {
        'page': page,
        'limit': limit,
        'search': searchQuery,
      });

      if (response.statusCode == 200) {
        return UserAdsResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load ads");
      }
    } on DioException catch (e) {
      throw Exception("Failed to load ads: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error occurred");
    }
  }

  /// Fetch ads for a specific user with pagination
  Future<UserAdsResponse> fetchUserAds({
    required String userId,
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      final response = await _dio.get('/ads/user/$userId', queryParameters: {
        'page': page,
        'limit': limit,
        'search': searchQuery,
      });

      if (response.statusCode == 200) {
        return UserAdsResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load user ads");
      }
    } on DioException catch (e) {
      throw Exception("Failed to load user ads: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error occurred");
    }
  }

  /// Update ad approval status
  Future<AdModel> updateAdApproval({
    required String adId,
    required bool isApproved,
  }) async {
    try {
      final response = await _dio.put('/ads/$adId/approval', data: {
        'isApproved': isApproved,
      });

      if (response.statusCode == 200) {
        return AdModel.fromJson(response.data);
      } else {
        throw Exception("Failed to update ad approval");
      }
    } on DioException catch (e) {
      throw Exception("Failed to update ad approval: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error occurred");
    }
  }
}
