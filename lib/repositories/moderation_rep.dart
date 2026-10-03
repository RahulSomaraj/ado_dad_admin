import 'package:ado_dad_admin/models/moderation/moderation_models.dart';
import 'package:ado_dad_admin/repositories/api_service.dart';
import 'package:dio/dio.dart';

class ModerationRepository {
  final Dio _dio = ApiService().dio;

  Map<String, dynamic> _asMap(dynamic data) =>
      data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};

  // ---------------------------------------------------------------- Profile
  Future<ModerationProfile> getProfile(String userId) async {
    final res = await _dio.get('/moderation/users/$userId');
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  // ---------------------------------------------------------------- Strikes
  Future<Paginated<StrikeModel>> getStrikes(String userId,
      {int page = 1, int limit = 20}) async {
    final res = await _dio.get('/moderation/users/$userId/strikes',
        queryParameters: {'page': page, 'limit': limit});
    return Paginated.fromJson(_asMap(res.data), StrikeModel.fromJson);
  }

  Future<ModerationProfile> addStrike(String userId,
      {required String reason, String? reportId, String? notes}) async {
    final res = await _dio.post('/moderation/users/$userId/strikes', data: {
      'reason': reason,
      if (reportId != null) 'reportId': reportId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  Future<ModerationProfile> removeStrike(String strikeId) async {
    final res = await _dio.delete('/moderation/strikes/$strikeId');
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  // ------------------------------------------------------------ Suspensions
  Future<ModerationProfile> suspend(String userId,
      {required String reason,
      required int durationDays,
      String? reportId,
      String? notes}) async {
    final res = await _dio.post('/moderation/users/$userId/suspend', data: {
      'reason': reason,
      'durationDays': durationDays,
      if (reportId != null) 'reportId': reportId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  Future<ModerationProfile> unsuspend(String userId) async {
    final res = await _dio.post('/moderation/users/$userId/unsuspend');
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  Future<ModerationProfile> ban(String userId,
      {required String reason, String? reportId, String? notes}) async {
    final res = await _dio.post('/moderation/users/$userId/ban', data: {
      'reason': reason,
      if (reportId != null) 'reportId': reportId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return ModerationProfile.fromJson(_asMap(res.data));
  }

  Future<Paginated<SuspensionModel>> getSuspensions(String userId,
      {int page = 1, int limit = 20}) async {
    final res = await _dio.get('/moderation/users/$userId/suspensions',
        queryParameters: {'page': page, 'limit': limit});
    return Paginated.fromJson(_asMap(res.data), SuspensionModel.fromJson);
  }

  Future<Paginated<SuspensionModel>> listSuspensions(
      {String? status, String? search, int page = 1, int limit = 20}) async {
    final res = await _dio.get('/moderation/suspensions', queryParameters: {
      'page': page,
      'limit': limit,
      if (status != null && status.isNotEmpty) 'status': status,
      if (search != null && search.isNotEmpty) 'search': search,
    });
    return Paginated.fromJson(_asMap(res.data), SuspensionModel.fromJson);
  }

  // --------------------------------------------------------------- Audit log
  Future<Paginated<AuditLogModel>> getAuditLogs(
      {String? targetId,
      String? actionType,
      int page = 1,
      int limit = 20}) async {
    final res = await _dio.get('/moderation/audit-logs', queryParameters: {
      'page': page,
      'limit': limit,
      if (targetId != null) 'targetId': targetId,
      if (actionType != null) 'actionType': actionType,
    });
    return Paginated.fromJson(_asMap(res.data), AuditLogModel.fromJson);
  }

  // ---------------------------------------------------------------- Settings
  Future<ModerationSettings> getSettings() async {
    final res = await _dio.get('/moderation/settings');
    return ModerationSettings.fromJson(_asMap(res.data));
  }

  Future<ModerationSettings> updateSettings(ModerationSettings settings) async {
    final res = await _dio.put('/moderation/settings', data: {
      'thresholds': settings.thresholds.map((t) => t.toJson()).toList(),
      'notifyByEmail': settings.notifyByEmail,
      'notifyByPush': settings.notifyByPush,
    });
    return ModerationSettings.fromJson(_asMap(res.data));
  }

  // -------------------------------------------------------------- Ad removal
  Future<void> removeAd(String adId, String reason) async {
    await _dio.post('/moderation/ads/$adId/remove', data: {'reason': reason});
  }

  Future<void> restoreAd(String adId) async {
    await _dio.post('/moderation/ads/$adId/restore');
  }

  // ----------------------------------------------------------------- Appeals
  Future<Paginated<AppealModel>> listAppeals(
      {String? status, int page = 1, int limit = 20}) async {
    final res = await _dio.get('/moderation/appeals', queryParameters: {
      'page': page,
      'limit': limit,
      if (status != null && status.isNotEmpty) 'appealStatus': status,
    });
    return Paginated.fromJson(_asMap(res.data), AppealModel.fromJson);
  }

  Future<void> reviewAppeal(String appealId,
      {required String decision, String? note}) async {
    await _dio.patch('/moderation/appeals/$appealId/review', data: {
      'decision': decision,
      if (note != null && note.isNotEmpty) 'note': note,
    });
  }

  // ----------------------------------------------------------------- Reports
  Future<void> resolveReport(String reportId, {String? notes}) async {
    await _dio.patch('/user-reports/$reportId/resolve',
        data: {if (notes != null && notes.isNotEmpty) 'adminNotes': notes});
  }

  Future<void> dismissReport(String reportId, {String? notes}) async {
    await _dio.patch('/user-reports/$reportId/dismiss',
        data: {if (notes != null && notes.isNotEmpty) 'adminNotes': notes});
  }
}
