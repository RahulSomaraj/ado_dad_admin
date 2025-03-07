import 'package:ado_dad_admin/models/vehicle_model.dart';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleRepository {
  final Dio _dio;

  VehicleRepository() : _dio = ApiService().dio;

  Future<List<VehicleModel>> fetchAllVehicles({
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
          'name': searchQuery,
        },
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((vehicle) => VehicleModel.fromJson(vehicle))
            .toList();
      } else {
        throw Exception("Failed to load vehicles");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }

  /// ✅ Create a new vehicle
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

  // /// ✅ Update a vehicle
  // Future<void> updateVehicle(VehicleModel vehicle) async {
  //   try {
  //     final response = await _dio.put(
  //       '/vehicles/${vehicle.id}',
  //       data: vehicle.toJson(),
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception("Failed to update vehicle");
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(DioErrorHandler.handleError(e));
  //   }
  // }

  //  /// ✅ Delete a vehicle by ID
  // Future<void> deleteVehicle(String vehicleId) async {
  //   try {
  //     final response = await _dio.delete('/vehicles/$vehicleId');

  //     if (response.statusCode != 200) {
  //       throw Exception("Failed to delete vehicle");
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(DioErrorHandler.handleError(e));
  //   } catch (e) {
  //     throw Exception("Unexpected error");
  //   }
  // }
}
