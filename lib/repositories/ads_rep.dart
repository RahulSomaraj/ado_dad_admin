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
      print('🌐 API Call: POST /v2/ads/list');
      final response = await _dio.post('/v2/ads/list', data: {
        'page': page,
        'limit': limit,
        'search': searchQuery,
      });

      print('✅ API Response Status: ${response.statusCode}');
      print('📄 API Response Data: ${response.data}');

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
        throw Exception("Failed to load ads");
      }
    } on DioException catch (e) {
      print('❌ DioException in fetchAllAds: $e');
      throw Exception("Failed to load ads: ${e.message}");
    } catch (e) {
      print('❌ Unexpected error in fetchAllAds: $e');
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
      print('🌐 API Call: GET /ads/user/$userId');
      final response = await _dio.get('/ads/user/$userId', queryParameters: {
        'page': page,
        'limit': limit,
        'search': searchQuery,
      });

      print('✅ API Response Status: ${response.statusCode}');
      print('📄 API Response Data: ${response.data}');

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
      print('❌ DioException in fetchUserAds: $e');
      throw Exception("Failed to load user ads: ${e.message}");
    } catch (e) {
      print('❌ Unexpected error in fetchUserAds: $e');
      throw Exception("Unexpected error occurred");
    }
  }
}
