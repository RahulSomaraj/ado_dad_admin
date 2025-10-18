import 'package:ado_dad_admin/models/report_model.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class ReportsRepository {
  final Dio _dio;

  ReportsRepository() : _dio = ApiService().dio;

  /// Fetch report statistics
  Future<ReportStatsModel> fetchReportStats() async {
    try {
      print('🔍 Fetching report stats from: /user-reports/stats');
      final response = await _dio.get('/user-reports/stats');

      print('📊 Stats API Response Status: ${response.statusCode}');
      print('📊 Stats API Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final stats = ReportStatsModel.fromJson(response.data);
        print(
            '✅ Successfully parsed stats: Total=${stats.totalReports}, Pending=${stats.pendingReports}');
        return stats;
      } else {
        throw Exception("Failed to load report stats");
      }
    } on DioException catch (e) {
      print('❌ DioException fetching report stats: $e');
      print('❌ Response: ${e.response?.data}');
      print('❌ Status Code: ${e.response?.statusCode}');

      // If it's a 404, the endpoint might not exist
      if (e.response?.statusCode == 404) {
        print('🔄 Endpoint not found, trying alternative: /reports/stats');
        try {
          final altResponse = await _dio.get('/reports/stats');
          if (altResponse.statusCode == 200) {
            final stats = ReportStatsModel.fromJson(altResponse.data);
            print('✅ Alternative endpoint worked: Total=${stats.totalReports}');
            return stats;
          }
        } catch (altE) {
          print('❌ Alternative endpoint also failed: $altE');
        }
      }

      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error fetching report stats: $e');
      throw Exception("Unexpected error: $e");
    }
  }

  /// Fetch reports list with pagination
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
        if (searchQuery != null && searchQuery.isNotEmpty)
          'search': searchQuery,
        if (status != null && status.isNotEmpty) 'status': status,
        if (reason != null && reason.isNotEmpty) 'reason': reason,
      };

      print('🔍 Fetching reports from: /user-reports');
      print('🔍 Query parameters: $queryParameters');
      final response = await _dio.get(
        '/user-reports',
        queryParameters: queryParameters,
      );

      print('📊 Reports API Response Status: ${response.statusCode}');
      print('📊 Reports API Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final reportsResponse = ReportListResponse.fromJson(response.data);
        print(
            '✅ Successfully parsed reports: ${reportsResponse.data.length} reports');
        return reportsResponse;
      } else {
        throw Exception("Failed to load reports");
      }
    } on DioException catch (e) {
      print('❌ DioException fetching reports: $e');
      print('❌ Response: ${e.response?.data}');
      print('❌ Status Code: ${e.response?.statusCode}');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error fetching reports: $e');
      throw Exception("Unexpected error: $e");
    }
  }

  /// Delete a report
  Future<void> deleteReport(String reportId) async {
    try {
      print('🔍 Deleting report with ID: $reportId');
      print('🔍 Delete endpoint: /user-reports/$reportId');
      final response = await _dio.delete('/user-reports/$reportId');

      print('📊 Delete API Response Status: ${response.statusCode}');
      print('📊 Delete API Response Data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('✅ Report deleted successfully');
        // Success
      } else {
        print('❌ Delete failed with status code: ${response.statusCode}');
        throw Exception("Failed to delete report");
      }
    } on DioException catch (e) {
      print('❌ DioException deleting report: $e');
      print('❌ Response: ${e.response?.data}');
      print('❌ Status Code: ${e.response?.statusCode}');
      throw Exception(DioErrorHandler.handleError(e));
    } catch (e) {
      print('❌ Unexpected error deleting report: $e');
      throw Exception("Unexpected error: $e");
    }
  }
}
