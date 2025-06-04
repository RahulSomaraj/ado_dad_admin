import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleRepository {
  final Dio _dio;

  VehicleRepository() : _dio = ApiService().dio;

  Future<List<VehicleRequest>> fetchAllVehicles({
    int? page,
    int? limit,
    String? searchQuery,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicles',
        queryParameters: {
          'page': page,
          'limit': limit,
          'modelName': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print("Vehicle API Response: ${response.data}");
        if (data is List) {
          return data
              .map((vehicle) => VehicleRequest.fromJson(vehicle))
              .toList();
        } else if (data is Map<String, dynamic> && data.containsKey("data")) {
          return (data["data"] as List)
              .cast<Map<String, dynamic>>()
              .map((vehicle) => VehicleRequest.fromJson(vehicle))
              .toList();
        } else {
          throw Exception("Invalid response format");
        }
      } else {
        throw Exception(
            "Failed to load vehicles, Status Code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e, stacktrace) {
      print("Unexpected Error: $e");
      print(stacktrace);
      throw Exception("Unexpected error occurred");
    }
  }

  Future<String> createVehicle(VehicleRequest vehicleData) async {
    try {
      final response = await _dio.post(
        "/vehicles",
        data: vehicleData.toJson(),
      );

      if (response.statusCode == 201) {
        return response.data['message'] ?? "Vehicle added successfully";
      } else {
        throw Exception("Failed to add vehicle: ${response.statusMessage}");
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

  Future<void> updateVehicle(VehicleRequest vehicle) async {
    try {
      final response = await _dio.put(
        '/vehicles/${vehicle.id}',
        data: {
          'name': vehicle.name,
          'modelName': vehicle.modelName,
          'modelType': vehicle.modelType,
          'wheelerType': vehicle.wheelerType,
          'modeLYear': vehicle.details.modelYear,
          'month': vehicle.details.month,
          'vendor': vehicle.vendor,
          'vehicleModels':
              vehicle.vehicleModels.map((model) => model.toJson()).toList(),
          'color': vehicle.color
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to update vehicle");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<void> deleteVehicle(String vehicleId) async {
    try {
      final response = await _dio.delete('/vehicles/$vehicleId');
      print('repo called:..........$vehicleId');
      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to delete Vehicle");
      }
    } on DioException catch (e) {
      print('??????$e????????');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }
}
