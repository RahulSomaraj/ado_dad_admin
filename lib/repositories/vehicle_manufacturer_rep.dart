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
    bool? isActive,
  }) async {
    try {
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

      if (isActive != null) {
        queryParams['isActive'] = isActive;
      }
      final response = await _dio.get(
        '/vehicle-inventory/manufacturers',
        queryParameters: queryParams,
      );

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
      final response = await _dio.post(
        "/vehicle-inventory/manufacturers",
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
      if (response.statusCode == 201) {
        return response.data['message'] ??
            "Vehicle manufacturer added successfully";
      } else {
        throw Exception(
            "Failed to add vehicle manufacturer: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        String? errorMessage;
        if (e.response!.data is Map) {
          errorMessage = e.response!.data['message'] ??
              e.response!.data['error'] ??
              e.response!.data['detail'] ??
              e.response!.data.toString();
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        } else {
          errorMessage = e.response!.data.toString();
        }
        throw Exception(errorMessage ?? "API error occurred");
      } else if (e.response != null) {
        throw Exception(
            "API error: ${e.response!.statusCode} ${e.response!.statusMessage ?? 'Unknown error'}");
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
      if (e.response != null && e.response!.data != null) {
        String? errorMessage;
        if (e.response!.data is Map) {
          errorMessage = e.response!.data['message'] ??
              e.response!.data['error'] ??
              e.response!.data['detail'] ??
              e.response!.data.toString();
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        } else {
          errorMessage = e.response!.data.toString();
        }
        throw Exception(errorMessage ?? "API error occurred");
      } else if (e.response != null) {
        throw Exception(
            "API error: ${e.response!.statusCode} ${e.response!.statusMessage ?? 'Unknown error'}");
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
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        '/vehicle-inventory/upload',
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
      if (e.response != null) {
        String? errorMessage;
        if (e.response!.data is Map) {
          errorMessage = e.response!.data['message'] ??
              e.response!.data['error'] ??
              e.response!.data['detail'] ??
              e.response!.data.toString();
        } else {
          errorMessage = e.response!.data.toString();
        }
        throw Exception(errorMessage ?? "API error occurred");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
