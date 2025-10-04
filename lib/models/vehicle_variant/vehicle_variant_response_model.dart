// import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'vehicle_variant_response_model.freezed.dart';
// part 'vehicle_variant_response_model.g.dart';

// @freezed
// class VehicleVariantResponseModel with _$VehicleVariantResponseModel {
//   const factory VehicleVariantResponseModel({
//     @JsonKey(name: '_id') required String id,
//     required String name,
//     required String displayName,
//     required VehicleModel vehicleModel,
//     FuelType? fuelType,
//     TransmissionType? transmissionType,
//     String? featurePackage,
//     EngineSpecs? engineSpecs,
//     PerformanceSpecs? performanceSpecs,
//     int? seatingCapacity,
//     int? price,
//     required bool isActive,
//     bool? isDeleted,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) = _VehicleVariantResponseModel;

//   factory VehicleVariantResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$VehicleVariantResponseModelFromJson(json);
// }

// @freezed
// class VehicleVariantPaginatedResponse with _$VehicleVariantPaginatedResponse {
//   const factory VehicleVariantPaginatedResponse({
//     required List<VehicleVariantResponseModel> data,
//     required int total,
//     required int page,
//     required int limit,
//     required int totalPages,
//     required bool hasNext,
//     required bool hasPrev,
//   }) = _VehicleVariantPaginatedResponse;

//   factory VehicleVariantPaginatedResponse.fromJson(Map<String, dynamic> json) =>
//       _$VehicleVariantPaginatedResponseFromJson(json);
// }

// @freezed
// class FuelType with _$FuelType {
//   const factory FuelType({
//     @JsonKey(name: '_id') required String id,
//     required String name,
//     required String displayName,
//   }) = _FuelType;

//   factory FuelType.fromJson(Map<String, dynamic> json) =>
//       _$FuelTypeFromJson(json);
// }

// @freezed
// class TransmissionType with _$TransmissionType {
//   const factory TransmissionType({
//     @JsonKey(name: '_id') required String id,
//     required String name,
//     required String displayName,
//   }) = _TransmissionType;

//   factory TransmissionType.fromJson(Map<String, dynamic> json) =>
//       _$TransmissionTypeFromJson(json);
// }

// @freezed
// class EngineSpecs with _$EngineSpecs {
//   const factory EngineSpecs({
//     String? engineType,
//     int? displacement,
//     int? maxPower,
//     int? maxTorque,
//   }) = _EngineSpecs;

//   factory EngineSpecs.fromJson(Map<String, dynamic> json) =>
//       _$EngineSpecsFromJson(json);
// }

// @freezed
// class PerformanceSpecs with _$PerformanceSpecs {
//   const factory PerformanceSpecs({
//     int? topSpeed,
//     double? acceleration,
//   }) = _PerformanceSpecs;

//   factory PerformanceSpecs.fromJson(Map<String, dynamic> json) =>
//       _$PerformanceSpecsFromJson(json);
// }

// import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';

class VehicleVariantResponseModel {
  final String id;
  final String name;
  final String displayName;
  // final VehicleModel vehicleModel;
  final FuelType? fuelType;
  final TransmissionType? transmissionType;
  final String? featurePackage;
  final EngineSpecs? engineSpecs;
  final PerformanceSpecs? performanceSpecs;
  final int? seatingCapacity;
  final int? price;
  final bool isActive;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleVariantResponseModel({
    required this.id,
    required this.name,
    required this.displayName,
    // required this.vehicleModel,
    this.fuelType,
    this.transmissionType,
    this.featurePackage,
    this.engineSpecs,
    this.performanceSpecs,
    this.seatingCapacity,
    this.price,
    required this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleVariantResponseModel.fromJson(Map<String, dynamic> json) {
    return VehicleVariantResponseModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      displayName: json['displayName'] ?? '',
      // vehicleModel: VehicleModel.fromJson(json['vehicleModel'] ?? {}),
      fuelType:
          json['fuelType'] != null ? FuelType.fromJson(json['fuelType']) : null,
      transmissionType: json['transmissionType'] != null
          ? TransmissionType.fromJson(json['transmissionType'])
          : null,
      featurePackage: json['featurePackage'],
      engineSpecs: json['engineSpecs'] != null
          ? EngineSpecs.fromJson(json['engineSpecs'])
          : null,
      performanceSpecs: json['performanceSpecs'] != null
          ? PerformanceSpecs.fromJson(json['performanceSpecs'])
          : null,
      seatingCapacity: json['seatingCapacity'],
      price: json['price'],
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }
}

class VehicleVariantPaginatedResponse {
  final List<VehicleVariantResponseModel> data;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  VehicleVariantPaginatedResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory VehicleVariantPaginatedResponse.fromJson(Map<String, dynamic> json) {
    return VehicleVariantPaginatedResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => VehicleVariantResponseModel.fromJson(e))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      totalPages: json['totalPages'] ?? 1,
      hasNext: json['hasNext'] ?? false,
      hasPrev: json['hasPrev'] ?? false,
    );
  }
}

class FuelType {
  final String id;
  final String name;
  final String displayName;

  FuelType({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory FuelType.fromJson(Map<String, dynamic> json) {
    return FuelType(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      displayName: json['displayName'] ?? '',
    );
  }
}

class TransmissionType {
  final String id;
  final String name;
  final String displayName;

  TransmissionType({
    required this.id,
    required this.name,
    required this.displayName,
  });

  factory TransmissionType.fromJson(Map<String, dynamic> json) {
    return TransmissionType(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      displayName: json['displayName'] ?? '',
    );
  }
}

class EngineSpecs {
  final String? engineType;
  final int? displacement;
  final int? maxPower;
  final int? maxTorque;

  EngineSpecs({
    this.engineType,
    this.displacement,
    this.maxPower,
    this.maxTorque,
  });

  factory EngineSpecs.fromJson(Map<String, dynamic> json) {
    return EngineSpecs(
      engineType: json['engineType'],
      displacement: json['displacement'],
      maxPower: json['maxPower'],
      maxTorque: json['maxTorque'],
    );
  }
}

class PerformanceSpecs {
  final int? topSpeed;
  final double? acceleration;

  PerformanceSpecs({
    this.topSpeed,
    this.acceleration,
  });

  factory PerformanceSpecs.fromJson(Map<String, dynamic> json) {
    return PerformanceSpecs(
      topSpeed: json['topSpeed'],
      acceleration: (json['acceleration'] != null)
          ? (json['acceleration'] as num).toDouble()
          : null,
    );
  }
}
