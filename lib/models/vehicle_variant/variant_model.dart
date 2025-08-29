// import 'package:ado_dad_admin/models/vehicle_model.dart' as shared_model;
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant_model.freezed.dart';
part 'variant_model.g.dart';

@freezed
class VariantModel with _$VariantModel {
  const factory VariantModel({
    @JsonKey(name: '_id') String? id,
    required String name,
    required String displayName,
    required VehicleModel vehicleModel,
    FuelType? fuelType,
    TransmissionType? transmissionType,
    String? featurePackage,
    EngineSpecs? engineSpecs,
    PerformanceSpecs? performanceSpecs,
    int? seatingCapacity,
    int? price,
    required bool isActive,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VariantModel;

  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);
}

extension VariantModelPostJson on VariantModel {
  Map<String, dynamic> toPostJson() {
    return {
      'name': name,
      'displayName': displayName,
      'vehicleModel': vehicleModel.id,
      'fuelType': fuelType?.id,
      'transmissionType': transmissionType?.id,
      'featurePackage': featurePackage,
      'engineSpecs': engineSpecs!.toJson(),
      'performanceSpecs': performanceSpecs!.toJson(),
      'seatingCapacity': seatingCapacity,
      'price': price,
    };
  }
}

// @freezed
// class VehicleModel with _$VehicleModel {
//   const factory VehicleModel({
//     @JsonKey(name: '_id') required String id,
//     required String name,
//     required String displayName,
//   }) = _VehicleModel;

//   factory VehicleModel.fromJson(Map<String, dynamic> json) =>
//       _$VehicleModelFromJson(json);
// }

// extension VehicleModelJson on VehicleModel {
//   Map<String, dynamic> toJson() => (this as _VehicleModel).toJson();
// }

@freezed
class FuelType with _$FuelType {
  const factory FuelType({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String displayName,
  }) = _FuelType;

  factory FuelType.fromJson(Map<String, dynamic> json) =>
      _$FuelTypeFromJson(json);
}

extension FuelTypeJson on FuelType {
  Map<String, dynamic> toJson() => (this as _FuelType).toJson();
}

@freezed
class TransmissionType with _$TransmissionType {
  const factory TransmissionType({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String displayName,
  }) = _TransmissionType;

  factory TransmissionType.fromJson(Map<String, dynamic> json) =>
      _$TransmissionTypeFromJson(json);
}

extension TransmissionTypeJson on TransmissionType {
  Map<String, dynamic> toJson() => (this as _TransmissionType).toJson();
}

@freezed
class VariantResponse with _$VariantResponse {
  const factory VariantResponse({
    required List<VariantModel> data,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = _VariantResponse;

  factory VariantResponse.fromJson(Map<String, dynamic> json) =>
      _$VariantResponseFromJson(json);
}

extension VariantResponseJson on VariantResponse {
  Map<String, dynamic> toJson() => (this as _VariantResponse).toJson();
}

@freezed
class EngineSpecs with _$EngineSpecs {
  const factory EngineSpecs({
    required int capacity,
    required int maxPower,
    required int maxTorque,
  }) = _EngineSpecs;

  factory EngineSpecs.fromJson(Map<String, dynamic> json) =>
      _$EngineSpecsFromJson(json);
}

extension EngineSpecsJson on EngineSpecs {
  Map<String, dynamic> toJson() => (this as _EngineSpecs).toJson();
}

@freezed
class PerformanceSpecs with _$PerformanceSpecs {
  const factory PerformanceSpecs({
    required double mileage,
  }) = _PerformanceSpecs;

  factory PerformanceSpecs.fromJson(Map<String, dynamic> json) =>
      _$PerformanceSpecsFromJson(json);
}

extension PerformanceSpecsJson on PerformanceSpecs {
  Map<String, dynamic> toJson() => (this as _PerformanceSpecs).toJson();
}
