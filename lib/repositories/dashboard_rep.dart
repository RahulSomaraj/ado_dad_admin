import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

/// Aggregated stats for the admin dashboard, sourced from the backend
/// count/stats endpoints:
///   GET /users/count      -> { total, normalUsers, showrooms, admins, byType }
///   GET /showrooms/count  -> { total }
///   GET /ads/stats        -> { total, approved, pending, sold, totalValue }
///
/// Any field may be null if its endpoint is unavailable; the UI shows a
/// placeholder in that case.
class DashboardStats {
  final int? totalUsers;
  final int? totalShowrooms;
  final int? totalListings;
  final int? soldListings;
  final int? totalValue;

  const DashboardStats({
    this.totalUsers,
    this.totalShowrooms,
    this.totalListings,
    this.soldListings,
    this.totalValue,
  });
}

/// A single day's count of newly-added listings.
class DailyCount {
  final DateTime date;
  final int count;
  const DailyCount(this.date, this.count);
}

class DashboardRepository {
  final Dio _dio = ApiService().dio;

  /// Per-day counts of ads added over the last [days] days.
  /// Returns an empty list if the endpoint is unavailable.
  Future<List<DailyCount>> fetchDailyAddedListings({int days = 7}) async {
    try {
      final res = await _dio.get(
        '/ads/stats/daily',
        queryParameters: {'days': days},
      );
      if (res.statusCode == 200 && res.data is List) {
        return (res.data as List)
            .whereType<Map>()
            .map((m) => DailyCount(
                  DateTime.tryParse(m['date']?.toString() ?? '')?.toLocal() ??
                      DateTime.now(),
                  _asInt(m['count']) ?? 0,
                ))
            .toList();
      }
    } catch (_) {
      // Endpoint unavailable — fall back to empty series.
    }
    return [];
  }

  Future<DashboardStats> fetchStats() async {
    // Fetched independently so one failing endpoint doesn't blank the others.
    final results = await Future.wait([
      _getInt('/users/count', 'total'),
      _getInt('/showrooms/count', 'total'),
      _fetchAdsStats(),
    ]);

    final users = results[0] as int?;
    final showrooms = results[1] as int?;
    final ads = results[2] as Map<String, int?>;

    return DashboardStats(
      totalUsers: users,
      totalShowrooms: showrooms,
      totalListings: ads['total'],
      soldListings: ads['sold'],
      totalValue: ads['totalValue'],
    );
  }

  Future<int?> _getInt(String path, String key) async {
    try {
      final res = await _dio.get(path);
      if (res.statusCode == 200 && res.data is Map) {
        return _asInt((res.data as Map)[key]);
      }
    } catch (_) {
      // Endpoint unavailable / not yet deployed — fall back to null.
    }
    return null;
  }

  Future<Map<String, int?>> _fetchAdsStats() async {
    try {
      final res = await _dio.get('/ads/stats');
      if (res.statusCode == 200 && res.data is Map) {
        final d = res.data as Map;
        return {
          'total': _asInt(d['total']),
          'sold': _asInt(d['sold']),
          'totalValue': _asInt(d['totalValue']),
        };
      }
    } catch (_) {
      // ignore
    }
    return {'total': null, 'sold': null, 'totalValue': null};
  }

  int? _asInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse(v.toString());
  }
}
