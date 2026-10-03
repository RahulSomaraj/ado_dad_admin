// Models for the Reports Management — User Strike & Suspension module.

int? _toInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v.toString());
}

DateTime? _toDate(dynamic v) {
  if (v == null) return null;
  return DateTime.tryParse(v.toString())?.toLocal();
}

String _nameFrom(dynamic v) {
  if (v == null) return '—';
  if (v is Map) return (v['name'] ?? v['email'] ?? '—').toString();
  return v.toString();
}

/// Generic paginated response: { data, total, page, limit, totalPages, hasNext, hasPrev }.
class Paginated<T> {
  final List<T> data;
  final int total;
  final int page;
  final int totalPages;

  const Paginated({
    required this.data,
    required this.total,
    required this.page,
    required this.totalPages,
  });

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) itemFromJson,
  ) {
    final list = (json['data'] as List<dynamic>? ?? [])
        .whereType<Map>()
        .map((e) => itemFromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Paginated(
      data: list,
      total: _toInt(json['total']) ?? list.length,
      page: _toInt(json['page']) ?? 1,
      totalPages: _toInt(json['totalPages']) ?? 1,
    );
  }
}

// ---------------------------------------------------------------------------
// Moderation profile
// ---------------------------------------------------------------------------
class ModerationProfile {
  final ModUser user;
  final int activeAds;
  final int previousReports;
  final int strikeCount;
  final SuspensionModel? currentSuspension;

  const ModerationProfile({
    required this.user,
    required this.activeAds,
    required this.previousReports,
    required this.strikeCount,
    this.currentSuspension,
  });

  factory ModerationProfile.fromJson(Map<String, dynamic> json) {
    final stats = (json['stats'] as Map?) ?? {};
    return ModerationProfile(
      user: ModUser.fromJson(Map<String, dynamic>.from(json['user'] ?? {})),
      activeAds: _toInt(stats['activeAds']) ?? 0,
      previousReports: _toInt(stats['previousReports']) ?? 0,
      strikeCount: _toInt(stats['strikeCount']) ?? 0,
      currentSuspension: json['currentSuspension'] == null
          ? null
          : SuspensionModel.fromJson(
              Map<String, dynamic>.from(json['currentSuspension'])),
    );
  }
}

class ModUser {
  final String id;
  final String name;
  final String email;
  final String? type;
  final int strikeCount;
  final String moderationStatus; // active | suspended | banned
  final DateTime? suspendedUntil;
  final String? profilePic;

  const ModUser({
    required this.id,
    required this.name,
    required this.email,
    this.type,
    required this.strikeCount,
    required this.moderationStatus,
    this.suspendedUntil,
    this.profilePic,
  });

  factory ModUser.fromJson(Map<String, dynamic> json) {
    return ModUser(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      name: (json['name'] ?? '—').toString(),
      email: (json['email'] ?? '').toString(),
      type: json['type']?.toString(),
      strikeCount: _toInt(json['strikeCount']) ?? 0,
      moderationStatus: (json['moderationStatus'] ?? 'active').toString(),
      suspendedUntil: _toDate(json['suspendedUntil']),
      profilePic: json['profilePic']?.toString(),
    );
  }
}

// ---------------------------------------------------------------------------
// Strike
// ---------------------------------------------------------------------------
class StrikeModel {
  final String id;
  final int level;
  final String reason;
  final String issuedBy;
  final String? notes;
  final bool isActive;
  final DateTime? createdAt;

  const StrikeModel({
    required this.id,
    required this.level,
    required this.reason,
    required this.issuedBy,
    this.notes,
    required this.isActive,
    this.createdAt,
  });

  factory StrikeModel.fromJson(Map<String, dynamic> json) {
    return StrikeModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      level: _toInt(json['level']) ?? 0,
      reason: (json['reason'] ?? '').toString(),
      issuedBy: _nameFrom(json['issuedBy']),
      notes: json['notes']?.toString(),
      isActive: json['isActive'] != false,
      createdAt: _toDate(json['createdAt']),
    );
  }
}

// ---------------------------------------------------------------------------
// Suspension
// ---------------------------------------------------------------------------
class SuspensionModel {
  final String id;
  final String? userId;
  final String userName;
  final String userEmail;
  final String type; // temporary | permanent_ban
  final String reason;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final String status; // active | lifted | expired
  final bool isAutomatic;
  final String issuedBy;
  final DateTime? createdAt;

  const SuspensionModel({
    required this.id,
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.type,
    required this.reason,
    this.startsAt,
    this.endsAt,
    required this.status,
    required this.isAutomatic,
    required this.issuedBy,
    this.createdAt,
  });

  bool get isBan => type == 'permanent_ban';

  factory SuspensionModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    return SuspensionModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      userId: user is Map ? (user['_id'] ?? user['id'])?.toString() : user?.toString(),
      userName: user is Map ? (user['name'] ?? '—').toString() : '—',
      userEmail: user is Map ? (user['email'] ?? '').toString() : '',
      type: (json['type'] ?? 'temporary').toString(),
      reason: (json['reason'] ?? '').toString(),
      startsAt: _toDate(json['startsAt']),
      endsAt: _toDate(json['endsAt']),
      status: (json['status'] ?? 'active').toString(),
      isAutomatic: json['isAutomatic'] == true,
      issuedBy: _nameFrom(json['issuedBy']),
      createdAt: _toDate(json['createdAt']),
    );
  }
}

// ---------------------------------------------------------------------------
// Audit log
// ---------------------------------------------------------------------------
class AuditLogModel {
  final String id;
  final String actor;
  final String actionType;
  final String targetType;
  final String? targetId;
  final String? notes;
  final DateTime? createdAt;

  const AuditLogModel({
    required this.id,
    required this.actor,
    required this.actionType,
    required this.targetType,
    this.targetId,
    this.notes,
    this.createdAt,
  });

  factory AuditLogModel.fromJson(Map<String, dynamic> json) {
    return AuditLogModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      actor: _nameFrom(json['actor']),
      actionType: (json['actionType'] ?? '').toString(),
      targetType: (json['targetType'] ?? '').toString(),
      targetId: json['targetId']?.toString(),
      notes: json['notes']?.toString(),
      createdAt: _toDate(json['createdAt']),
    );
  }
}

// ---------------------------------------------------------------------------
// Settings
// ---------------------------------------------------------------------------
class StrikeThreshold {
  int level;
  String action; // warning | notify | suspend | ban
  int? durationDays;

  StrikeThreshold({required this.level, required this.action, this.durationDays});

  factory StrikeThreshold.fromJson(Map<String, dynamic> json) {
    return StrikeThreshold(
      level: _toInt(json['level']) ?? 0,
      action: (json['action'] ?? 'warning').toString(),
      durationDays: _toInt(json['durationDays']),
    );
  }

  Map<String, dynamic> toJson() => {
        'level': level,
        'action': action,
        if (durationDays != null) 'durationDays': durationDays,
      };
}

class ModerationSettings {
  final List<StrikeThreshold> thresholds;
  bool notifyByEmail;
  bool notifyByPush;

  ModerationSettings({
    required this.thresholds,
    required this.notifyByEmail,
    required this.notifyByPush,
  });

  factory ModerationSettings.fromJson(Map<String, dynamic> json) {
    return ModerationSettings(
      thresholds: (json['thresholds'] as List<dynamic>? ?? [])
          .whereType<Map>()
          .map((e) => StrikeThreshold.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      notifyByEmail: json['notifyByEmail'] != false,
      notifyByPush: json['notifyByPush'] != false,
    );
  }
}

// ---------------------------------------------------------------------------
// Appeal
// ---------------------------------------------------------------------------
class AppealModel {
  final String id;
  final String userName;
  final String userEmail;
  final String message;
  final String status; // pending | approved | rejected
  final SuspensionModel? suspension;
  final DateTime? createdAt;
  final String? decisionNote;

  const AppealModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.message,
    required this.status,
    this.suspension,
    this.createdAt,
    this.decisionNote,
  });

  factory AppealModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    return AppealModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      userName: user is Map ? (user['name'] ?? '—').toString() : '—',
      userEmail: user is Map ? (user['email'] ?? '').toString() : '',
      message: (json['message'] ?? '').toString(),
      status: (json['status'] ?? 'pending').toString(),
      suspension: json['suspension'] is Map
          ? SuspensionModel.fromJson(
              Map<String, dynamic>.from(json['suspension']))
          : null,
      createdAt: _toDate(json['createdAt']),
      decisionNote: json['decisionNote']?.toString(),
    );
  }
}
