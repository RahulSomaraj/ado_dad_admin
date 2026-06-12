class ReportStatsModel {
  final int totalReports;
  final int pendingReports;
  final int resolvedReports;
  final int dismissedReports;
  final Map<String, int> reportsByReason;
  final Map<String, int> reportsByStatus;

  ReportStatsModel({
    required this.totalReports,
    required this.pendingReports,
    required this.resolvedReports,
    required this.dismissedReports,
    required this.reportsByReason,
    required this.reportsByStatus,
  });

  factory ReportStatsModel.fromJson(Map<String, dynamic> json) {
    return ReportStatsModel(
      totalReports: json['totalReports'] ?? 0,
      pendingReports: json['pendingReports'] ?? 0,
      resolvedReports: json['resolvedReports'] ?? 0,
      dismissedReports: json['dismissedReports'] ?? 0,
      reportsByReason: Map<String, int>.from(json['reportsByReason'] ?? {}),
      reportsByStatus: Map<String, int>.from(json['reportsByStatus'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalReports': totalReports,
      'pendingReports': pendingReports,
      'resolvedReports': resolvedReports,
      'dismissedReports': dismissedReports,
      'reportsByReason': reportsByReason,
      'reportsByStatus': reportsByStatus,
    };
  }
}

class ReportUserDetails {
  final String id;
  final String name;
  final String email;
  final String? phone;

  ReportUserDetails({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
  });

  factory ReportUserDetails.fromJson(Map<String, dynamic> json) {
    return ReportUserDetails(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      if (phone != null) 'phone': phone,
    };
  }
}

class ReportModel {
  final String id;
  final String reportedUser;
  final ReportUserDetails reportedUserDetails;
  final String reportedBy;
  final ReportUserDetails reportedByDetails;
  final String reason;
  final String description;
  final String status;
  final List<String> evidenceUrls;
  final int reportCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? relatedAd;
  final String? reviewedBy;
  final String? adminNotes;
  final DateTime? reviewedAt;

  ReportModel({
    required this.id,
    required this.reportedUser,
    required this.reportedUserDetails,
    required this.reportedBy,
    required this.reportedByDetails,
    required this.reason,
    required this.description,
    required this.status,
    required this.evidenceUrls,
    required this.reportCount,
    required this.createdAt,
    required this.updatedAt,
    this.relatedAd,
    this.reviewedBy,
    this.adminNotes,
    this.reviewedAt,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] ?? '',
      reportedUser: json['reportedUser'] ?? '',
      reportedUserDetails:
          ReportUserDetails.fromJson(json['reportedUserDetails'] ?? {}),
      reportedBy: json['reportedBy'] ?? '',
      reportedByDetails:
          ReportUserDetails.fromJson(json['reportedByDetails'] ?? {}),
      reason: json['reason'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      evidenceUrls: List<String>.from(json['evidenceUrls'] ?? []),
      reportCount: json['reportCount'] ?? 0,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      relatedAd: json['relatedAd'],
      reviewedBy: json['reviewedBy'],
      adminNotes: json['adminNotes'],
      reviewedAt: json['reviewedAt'] != null
          ? DateTime.tryParse(json['reviewedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reportedUser': reportedUser,
      'reportedUserDetails': reportedUserDetails.toJson(),
      'reportedBy': reportedBy,
      'reportedByDetails': reportedByDetails.toJson(),
      'reason': reason,
      'description': description,
      'status': status,
      'evidenceUrls': evidenceUrls,
      'reportCount': reportCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      if (relatedAd != null) 'relatedAd': relatedAd,
      if (reviewedBy != null) 'reviewedBy': reviewedBy,
      if (adminNotes != null) 'adminNotes': adminNotes,
      if (reviewedAt != null) 'reviewedAt': reviewedAt!.toIso8601String(),
    };
  }
}

class ReportListResponse {
  final List<ReportModel> data;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  ReportListResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory ReportListResponse.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List?;
    return ReportListResponse(
      data: (dataList ?? [])
          .map((report) => ReportModel.fromJson(report))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 1,
      hasNext: json['hasNext'] ?? false,
      hasPrev: json['hasPrev'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((report) => report.toJson()).toList(),
      'total': total,
      'page': page,
      'limit': limit,
      'totalPages': totalPages,
      'hasNext': hasNext,
      'hasPrev': hasPrev,
    };
  }
}
