import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleVariantRepository {
  final Dio _dio;

  VehicleVariantRepository() : _dio = ApiService().dio;

  /// Fetch all variants with optional pagination
  Future<VariantResponse> fetchAllVariants({
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/variants',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        return VariantResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch variants. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Fetch variants by vehicle model ID
  // Future<VariantResponse> fetchVariantsByModel({
  //   required String modelId,
  //   int page = 1,
  //   int limit = 10,
  // }) async {
  //   try {
  //     final response = await _dio.get(
  //       '/vehicle-inventory/variants',
  //       queryParameters: {
  //         'modelId': modelId,
  //         'page': page,
  //         'limit': limit,
  //       },
  //     );
  //     print('called: ${response.data}');
  //     if (response.statusCode == 200) {
  //       // final data = response.data['data'] as List<dynamic>;
  //       return VariantResponse.fromJson(response.data);
  //     } else {
  //       throw Exception(
  //           'Failed to fetch variants by model. Status code: ${response.statusCode}');
  //     }
  //   } on DioException catch (e) {
  //     print("❌ DioException Response: ${e.response?.data}");
  //     throw Exception(DioErrorHandler.handleError(e));
  //   } catch (e) {
  //     throw Exception('Unexpected error: $e');
  //   }
  // }

  Future<VehicleVariantPaginatedResponse> fetchVariantsByModel({
    required String modelId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/variants',
        queryParameters: {
          'modelId': modelId,
          'page': page,
          'limit': limit,
        },
      );
      print('✅ called: ${response.data}');
      if (response.statusCode == 200) {
        return VehicleVariantPaginatedResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch variants by model. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("❌ DioException Response: ${e.response?.data}");
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Create a new vehicle variant
  Future<void> createVariant(VariantModel variant) async {
    try {
      final payload = variant.toPostJson();
      print("🚀 Create Variant Payload: $payload");

      final response = await _dio.post(
        '/vehicle-inventory/variants',
        data: payload,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(
            "✅ Variant created successfully with ID: ${response.data['_id']}");
      } else {
        throw Exception(
          'Failed to create variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("❌ DioException Response: ${e.response?.data}");
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
