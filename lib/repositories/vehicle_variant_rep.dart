import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart'
    as variant_model;
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleVariantRepository {
  final Dio _dio;

  VehicleVariantRepository() : _dio = ApiService().dio;

  /// Fetch all variants with optional pagination
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

      // Debug: Check if fuelType and transmissionType are in the response
      if (response.data is Map && response.data['data'] is List) {
        final dataList = response.data['data'] as List;
        if (dataList.isNotEmpty) {
          print('🔍 First variant keys: ${dataList[0].keys}');
          print('🔍 First variant fuelType: ${dataList[0]['fuelType']}');
          print(
              '🔍 First variant transmissionType: ${dataList[0]['transmissionType']}');
        }
      }

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
  Future<void> createVariant(variant_model.VariantModel variant) async {
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

  /// Update an existing vehicle variant
  Future<void> updateVariant(
      String variantId, Map<String, dynamic> payload) async {
    try {
      print("🚀 Update Variant Payload: $payload");
      print("🚀 Update Variant ID: $variantId");

      final response = await _dio.put(
        '/vehicle-inventory/variants/$variantId',
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Variant updated successfully");
      } else {
        throw Exception(
          'Failed to update variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("❌ DioException Response: ${e.response?.data}");
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Delete a vehicle variant
  Future<void> deleteVariant(String variantId) async {
    try {
      print("🚀 Delete Variant ID: $variantId");

      final response = await _dio.delete(
        '/vehicle-inventory/variants/$variantId',
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("✅ Variant deleted successfully");
      } else {
        throw Exception(
          'Failed to delete variant. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("❌ DioException Response: ${e.response?.data}");
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Upload CSV file for vehicle variants
  Future<String> uploadVariantCsv(
      String modelId, List<int> fileBytes, String fileName) async {
    try {
      print('📤 Starting Variant CSV upload for model: $modelId');
      print('📁 File name: $fileName');
      print('📊 File size: ${fileBytes.length} bytes');

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
        'modelId': modelId, // Include modelId in form data
      });

      print('🌐 Uploading to: /vehicle-inventory/upload-vehicle-variants-csv');
      print('📋 Form data fields: modelId=$modelId, file=$fileName');

      final response = await _dio.post(
        '/vehicle-inventory/upload-vehicle-variants-csv',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      print('✅ Response status: ${response.statusCode}');
      print('📦 Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'] ?? "CSV file uploaded successfully";
      } else {
        print('❌ Unexpected status code: ${response.statusCode}');
        print('❌ Response message: ${response.statusMessage}');
        print('❌ Response data: ${response.data}');
        throw Exception("Failed to upload CSV file: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      print('❌ DioException during Variant CSV upload:');
      print('   Error: $e');
      print('   Response: ${e.response?.data}');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error during Variant CSV upload: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  /// Fetch fuel types from API
  Future<List<variant_model.FuelType>> fetchFuelTypes() async {
    try {
      final res = await _dio.get('/vehicle-inventory/fuel-types');
      // Expecting: { data: [ {...}, {...} ] } or directly a list
      final list = (res.data is Map && res.data['data'] is List)
          ? (res.data['data'] as List)
          : (res.data as List);
      return list
          .map(
              (e) => variant_model.FuelType.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      print('❌ Error fetching fuel types: $e');
      throw Exception(
          'Failed to load fuel types: ${e.response?.data ?? e.message}');
    }
  }

  /// Fetch transmission types from API
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
      print('❌ Error fetching transmission types: $e');
      throw Exception(
          'Failed to load transmission types: ${e.response?.data ?? e.message}');
    }
  }
}
