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
  }) async {
    try {
      print('Fetching manufacturers with: '
          'page=$page, limit=$limit, search="$searchQuery"');
      final response = await _dio.get(
        '/vehicle-inventory/manufacturers', // ✅ Replace with your actual endpoint
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': searchQuery,
        },
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
          "description": manufacturerData.description,
          "logo": manufacturerData.logo,
          "website": manufacturerData.website,
          "foundedYear": manufacturerData.foundedYear,
          "headquarters": manufacturerData.headquarters,
          "isActive": manufacturerData.isActive,
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
          "description": manufacturerData.description,
          "logo": manufacturerData.logo,
          "website": manufacturerData.website,
          "foundedYear": manufacturerData.foundedYear,
          "headquarters": manufacturerData.headquarters,
          "isActive": manufacturerData.isActive,
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
    int limit = 1000,
  }) async {
    try {
      print(
          '📦 Fetching manufacturers for dropdown with page=$page, limit=$limit');
      final response = await _dio.get(
        '/vehicle-inventory/manufacturers',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
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
}
