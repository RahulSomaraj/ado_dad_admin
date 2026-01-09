import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleManufacturerRepository {
  final Dio _dio;

  VehicleManufacturerRepository() : _dio = ApiService().dio;

  Future<VehicleManufacturerResponse> fetchAllManufacturers({
    int page = 1,
    int limit = 10,
    String? searchQuery,
    String? category,
  }) async {
    try {
      print('Fetching manufacturers with: '
          'page=$page, limit=$limit, search="${searchQuery ?? 'null'}", category="${category ?? 'null'}"');
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['search'] = searchQuery;
      }

      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }
      final response = await _dio.get(
        '/vehicle-inventory/manufacturers', // ✅ Replace with your actual endpoint
        queryParameters: queryParams,
      );
      // print('Manufactures Datas: ${response.data}');

      if (response.statusCode == 200) {
        return VehicleManufacturerResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load vehicle manufactures");
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to load manufacturers: ${e.response?.data ?? e.message}');
    }
  }

  Future<String> createManufacturer(
      VehicleManufacturer manufacturerData) async {
    try {
      print('create called');
      final response = await _dio.post(
        "/vehicle-inventory/manufacturers",
        // data: manufacturerData.toJson(),
        data: {
          "name": manufacturerData.name,
          "displayName": manufacturerData.displayName,
          "originCountry": manufacturerData.originCountry,
          if (manufacturerData.description != null)
            "description": manufacturerData.description,
          if (manufacturerData.logo != null) "logo": manufacturerData.logo,
          if (manufacturerData.website != null)
            "website": manufacturerData.website,
          if (manufacturerData.foundedYear != null)
            "foundedYear": manufacturerData.foundedYear,
          if (manufacturerData.headquarters != null)
            "headquarters": manufacturerData.headquarters,
          if (manufacturerData.vehicleCategory != null)
            "vehicleCategory": manufacturerData.vehicleCategory,
          "isActive": manufacturerData.isActive,
          "isPremium": manufacturerData.isPremium,
        },
      );
      print('create called:$response');
      if (response.statusCode == 201) {
        return response.data['message'] ??
            "Vehicle manufacturer added successfully";
      } else {
        throw Exception(
            "Failed to add vehicle manufacturer: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message'] ?? "API error occurred");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<String> updateManufacturer(
      VehicleManufacturer manufacturerData) async {
    try {
      final response = await _dio.put(
        "/vehicle-inventory/manufacturers/${manufacturerData.id}",
        data: {
          "name": manufacturerData.name,
          "displayName": manufacturerData.displayName,
          "originCountry": manufacturerData.originCountry,
          if (manufacturerData.description != null)
            "description": manufacturerData.description,
          if (manufacturerData.logo != null) "logo": manufacturerData.logo,
          if (manufacturerData.website != null)
            "website": manufacturerData.website,
          if (manufacturerData.foundedYear != null)
            "foundedYear": manufacturerData.foundedYear,
          if (manufacturerData.headquarters != null)
            "headquarters": manufacturerData.headquarters,
          if (manufacturerData.vehicleCategory != null)
            "vehicleCategory": manufacturerData.vehicleCategory,
          "isActive": manufacturerData.isActive,
          "isPremium": manufacturerData.isPremium,
        },
      );
      if (response.statusCode == 200) {
        return response.data['message'] ??
            "Vehicle manufacturer updated successfully";
      } else {
        throw Exception(
            "Failed to update vehicle manufacturer: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message'] ?? "API error occurred");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<String> deleteManufacturer(String id) async {
    try {
      final response = await _dio.delete(
        "/vehicle-inventory/manufacturers/$id",
      );

      if (response.statusCode == 200) {
        return response.data['message'] ??
            "Vehicle manufacturer deleted successfully";
      } else {
        throw Exception(
            "Failed to delete manufacturer: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message'] ?? "API error occurred");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<VehicleManufacturerResponse> fetchDropDownManufacturers({
    int page = 1,
    int limit = 10,
    String? searchQuery,
  }) async {
    try {
      print(
          '📦 Fetching manufacturers for dropdown with page=$page, limit=$limit, search="${searchQuery ?? 'null'}"');
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['search'] = searchQuery;
      }

      final response = await _dio.get(
        '/vehicle-inventory/manufacturers',
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        return VehicleManufacturerResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load manufacturers for dropdown");
      }
    } on DioException catch (e) {
      throw Exception(
          'Failed to load manufacturers for dropdown: ${e.response?.data ?? e.message}');
    }
  }

  Future<String> uploadCsv(List<int> fileBytes, String fileName) async {
    try {
      print('📤 Starting CSV upload...');
      print('📁 File name: $fileName');
      print('📊 File size: ${fileBytes.length} bytes');

      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      });

      print('🌐 Uploading to: /vehicle-inventory/upload');

      final response = await _dio.post(
        '/vehicle-inventory/upload',
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
      print('❌ DioException occurred:');
      print('   Type: ${e.type}');
      print('   Message: ${e.message}');
      print('   Error: ${e.error}');

      if (e.response != null) {
        print('   Status Code: ${e.response!.statusCode}');
        print('   Status Message: ${e.response!.statusMessage}');
        print('   Response Headers: ${e.response!.headers}');
        print('   Response Data: ${e.response!.data}');
        print('   Response Data Type: ${e.response!.data.runtimeType}');

        // Try to extract error message from different possible formats
        String? errorMessage;
        if (e.response!.data is Map) {
          errorMessage = e.response!.data['message'] ??
              e.response!.data['error'] ??
              e.response!.data['detail'] ??
              e.response!.data.toString();
        } else {
          errorMessage = e.response!.data.toString();
        }

        print('   Extracted Error Message: $errorMessage');

        throw Exception(errorMessage ?? "API error occurred");
      } else {
        print('   No response received');
        print('   Request Options: ${e.requestOptions}');
        throw Exception("Network error: ${e.message}");
      }
    } catch (e, stackTrace) {
      print('❌ Unexpected error occurred:');
      print('   Error: $e');
      print('   Error Type: ${e.runtimeType}');
      print('   Stack Trace: $stackTrace');
      throw Exception("Unexpected error: $e");
    }
  }
}
