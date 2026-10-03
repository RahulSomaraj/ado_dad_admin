import 'package:ado_dad_admin/models/vehicle_variant/variant_list_item.dart';
import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart'
    as variant_model;
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleVariantRepository {
  final Dio _dio;

  VehicleVariantRepository() : _dio = ApiService().dio;

  Future<variant_model.VariantResponse> fetchAllVariants({
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
        return variant_model.VariantResponse.fromJson(response.data);
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

  /// Cross-model variant listing for the standalone Variants page.
  ///
  /// Defensively parses each row (model name + specs) so a single orphaned
  /// variant can't break the whole list. Reuses the same backend endpoint.
  Future<VariantListPage> fetchAllVariantsDetailed({
    int page = 1,
    int limit = 10,
    String? searchQuery,
    String? modelId,
    bool? isActive,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-inventory/variants',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (searchQuery != null && searchQuery.trim().isNotEmpty)
            'search': searchQuery.trim(),
          if (modelId != null && modelId.isNotEmpty) 'modelId': modelId,
          if (isActive != null) 'isActive': isActive,
        },
      );

      if (response.statusCode == 200) {
        return VariantListPage.fromJson(
            response.data as Map<String, dynamic>);
      }
      throw Exception(
          'Failed to fetch variants. Status code: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

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

      if (response.statusCode == 200) {
        return VehicleVariantPaginatedResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch variants by model. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> createVariant(variant_model.VariantModel variant) async {
    try {
      final payload = variant.toPostJson();

      final response = await _dio.post(
        '/vehicle-inventory/variants',
        data: payload,
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception(
          'Failed to create variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> updateVariant(
      String variantId, Map<String, dynamic> payload) async {
    try {
      final response = await _dio.put(
        '/vehicle-inventory/variants/$variantId',
        data: payload,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
          'Failed to update variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> deleteVariant(String variantId) async {
    try {
      final response = await _dio.delete(
        '/vehicle-inventory/variants/$variantId',
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception(
          'Failed to delete variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<String> uploadVariantCsv(
      String modelId, List<int> fileBytes, String fileName) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
        'modelId': modelId,
      });

      final response = await _dio.post(
        '/vehicle-inventory/upload-vehicle-variants-csv',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'] ?? "CSV file uploaded successfully";
      } else {
        throw Exception("Failed to upload CSV file: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<variant_model.FuelType>> fetchFuelTypes() async {
    try {
      final res = await _dio.get('/vehicle-inventory/fuel-types');
      final list = (res.data is Map && res.data['data'] is List)
          ? (res.data['data'] as List)
          : (res.data as List);
      return list
          .map(
              (e) => variant_model.FuelType.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load fuel types: ${e.response?.data ?? e.message}');
    }
  }

  Future<List<variant_model.TransmissionType>> fetchTransmissionTypes() async {
    try {
      final res = await _dio.get('/vehicle-inventory/transmission-types');
      final list = (res.data is Map && res.data['data'] is List)
          ? (res.data['data'] as List)
          : (res.data as List);
      return list
          .map((e) => variant_model.TransmissionType.fromJson(
              e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(
          'Failed to load transmission types: ${e.response?.data ?? e.message}');
    }
  }
}
