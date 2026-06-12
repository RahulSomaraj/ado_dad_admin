import 'package:ado_dad_admin/models/report_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class ReportsRepository {
  final Dio _dio;

  ReportsRepository() : _dio = ApiService().dio;

  Future<ReportStatsModel> fetchReportStats() async {
    try {
      final response = await _dio.get('/user-reports/stats');
      if (response.statusCode == 200) {
        return ReportStatsModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load report stats");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        try {
          final altResponse = await _dio.get('/reports/stats');
          if (altResponse.statusCode == 200) {
            return ReportStatsModel.fromJson(altResponse.data);
          }
        } catch (_) {}
      }
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<ReportListResponse> fetchReports({
    int? page,
    int? limit,
    String? searchQuery,
    String? status,
    String? reason,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
        if (status != null && status.isNotEmpty) 'status': status,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
      };
      final response = await _dio.get('/user-reports', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return ReportListResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to load reports");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<void> deleteReport(String reportId) async {
    try {
      final response = await _dio.delete('/user-reports/$reportId');
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception("Failed to delete report");
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
