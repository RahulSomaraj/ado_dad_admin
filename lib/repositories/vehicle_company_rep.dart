import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class VehicleCompanyRepository {
  final Dio _dio;

  VehicleCompanyRepository() : _dio = ApiService().dio;

  Future<VehicleCompanyResponse> fetchAllCompanies({
    int? page,
    int? limit,
    String? searchQuery,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle-companies',
        queryParameters: {
          'page': page,
          'limit': limit,
          'name': searchQuery,
        },
      );

      if (response.statusCode == 200) {
        return VehicleCompanyResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load vehicle companies");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }

  Future<String> createCompany(VehicleCompanyModel companyData) async {
    try {
      final response = await _dio.post(
        "/vehicle-companies",
        data: companyData.toJson(),
      );

      if (response.statusCode == 201) {
        return response.data['message'] ?? "Vehicle company added successfully";
      } else {
        throw Exception(
            "Failed to add vehicle company: ${response.statusMessage}");
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

  Future<void> updateCompany(VehicleCompanyModel company) async {
    try {
      final response = await _dio.put(
        '/vehicle-companies/${company.id}',
        data: {
          'name': company.name,
          'originCountry': company.originCountry,
          'vehicleType': company.vehicleType,
          'logo': company.logo,
        },
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to update vehicle company");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    }
  }

  Future<void> deleteCompany(String companyId) async {
    try {
      final response = await _dio.delete('/vehicle-companies/$companyId');

      if (response.statusCode == 200) {
      } else {
        throw Exception("Failed to delete Vehicle Company");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }
}
