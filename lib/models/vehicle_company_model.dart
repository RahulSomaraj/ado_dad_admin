class VehicleCompanyModel {
  final String id;
  final String? name;
  final String? originCountry;
  final String? vehicleType;
  final String? logo;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  VehicleCompanyModel({
    required this.id,
    this.name,
    this.originCountry,
    this.vehicleType,
    this.logo,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  /// ✅ Handles `null` values properly
  factory VehicleCompanyModel.fromJson(Map<String, dynamic> json) {
    return VehicleCompanyModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      originCountry: json['originCountry'] ?? '',
      vehicleType: json['vehicleType'] ?? '',
      logo: json['logo'] ?? '',
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      v: json['__v'] ?? 0,
    );
  }

  /// ✅ Converts to JSON, omitting null values
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['name'] = name;
    data['originCountry'] = originCountry;
    data['vehicleType'] = vehicleType;
    data['logo'] = logo;
    if (isDeleted != null) data['isDeleted'] = isDeleted;
    if (createdAt != null) data['createdAt'] = createdAt!.toIso8601String();
    if (updatedAt != null) data['updatedAt'] = updatedAt!.toIso8601String();
    data['__v'] = v;
    return data;
  }

  /// ✅ Copy method to update only changed fields
  VehicleCompanyModel copyWith({
    String? name,
    String? originCountry,
    String? vehicleType,
    String? logo,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return VehicleCompanyModel(
      id: id,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
      vehicleType: vehicleType ?? this.vehicleType,
      logo: logo ?? this.logo,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }
}

class VehicleCompanyResponse {
  final List<VehicleCompanyModel> companies;
  final int totalPages;
  final int currentPage;
  final int total;
  final int limit;

  VehicleCompanyResponse({
    required this.companies,
    required this.totalPages,
    required this.currentPage,
    required this.total,
    required this.limit,
  });

  factory VehicleCompanyResponse.fromJson(Map<String, dynamic> json) {
    return VehicleCompanyResponse(
      companies: (json['data'] as List)
          .map((company) => VehicleCompanyModel.fromJson(company))
          .toList(),
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['page'] ?? 1,
      total: json['total'] ?? 0,
      limit: json['limit'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': companies.map((company) => company.toJson()).toList(),
      'totalPages': totalPages,
      'currentPage': currentPage,
      'total': total,
      'limit': limit,
    };
  }
}
