// import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'vehicle_model.freezed.dart';
// part 'vehicle_model.g.dart';

// @freezed
// class VehicleModel with _$VehicleModel {
//   @JsonSerializable(explicitToJson: true)
//   const factory VehicleModel({
//     @JsonKey(name: '_id') String? id,
//     required String name,
//     required String displayName,
//     required VehicleManufacturer manufacturer,
//     required String vehicleType,
//     String? description,
//     int? launchYear,
//     String? segment,
//     String? bodyType,
//     List<String>? images,
//     String? brochureUrl,
//     bool? isActive,
//     int? variantCount,
//     PriceRange? priceRange,
//     List<String>? availableFuelTypes,
//     List<String>? availableTransmissionTypes,
//     bool? isCommercialVehicle,
//     String? commercialVehicleType,
//     String? commercialBodyType,
//     int? defaultPayloadCapacity,
//     String? defaultPayloadUnit,
//     int? defaultAxleCount,
//     int? defaultSeatingCapacity,
//   }) = _VehicleModel;

//   factory VehicleModel.fromJson(Map<String, dynamic> json) =>
//       _$VehicleModelFromJson(json);
// }

// extension VehicleModelJson on VehicleModel {
//   Map<String, dynamic> toJson() => (this as _VehicleModel).toJson();
// }

// @freezed
// class VehicleModelResponse with _$VehicleModelResponse {
//   @JsonSerializable(explicitToJson: true)
//   const factory VehicleModelResponse({
//     required List<VehicleModel> data,
//     required int total,
//     required int page,
//     required int limit,
//     required int totalPages,
//     required bool hasNext,
//     required bool hasPrev,
//   }) = _VehicleModelResponse;

//   factory VehicleModelResponse.fromJson(Map<String, dynamic> json) =>
//       _$VehicleModelResponseFromJson(json);
// }

// extension VehicleModelResponseJson on VehicleModelResponse {
//   Map<String, dynamic> toJson() => (this as _VehicleModelResponse).toJson();
// }

// @freezed
// class PriceRange with _$PriceRange {
//   const factory PriceRange({
//     int? min,
//     int? max,
//   }) = _PriceRange;

//   factory PriceRange.fromJson(Map<String, dynamic> json) =>
//       _$PriceRangeFromJson(json);
// }

import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

// Helpers to sanitize lists
List<String>? _stringList(dynamic v) {
  if (v == null) return null;
  if (v is List) {
    // keep only non-null strings
    return v.whereType<String>().toList();
  }
  return null;
}

List<dynamic>? _stringListToJson(List<String>? v) => v;

// Helper to handle manufacturer field that can be either a Map or String (ID)
VehicleManufacturer? _manufacturerFromJson(dynamic json) {
  if (json == null) return null;
  if (json is String) {
    // If it's just an ID string, return null (manufacturer not populated)
    return null;
  }
  if (json is Map<String, dynamic>) {
    try {
      // Ensure required fields have defaults if missing from API response
      final manufacturerJson = Map<String, dynamic>.from(json);

      // Provide defaults for required fields that might be missing
      manufacturerJson['originCountry'] ??= '';
      manufacturerJson['isActive'] ??= true;

      return VehicleManufacturer.fromJson(manufacturerJson);
    } catch (e) {
      return null;
    }
  }
  return null;
}

@freezed
class VehicleModel with _$VehicleModel {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleModel({
    @JsonKey(name: '_id') String? id,

    // These are required in your UI, but backend may send null on fresh create
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String displayName,
    @JsonKey(fromJson: _manufacturerFromJson)
    VehicleManufacturer?
        manufacturer, // Make nullable to handle API null responses or string IDs
    @JsonKey(defaultValue: '') required String vehicleType,
    String? description,
    int? launchYear,
    String? segment,
    String? bodyType,

    // Sanitize possible nulls inside arrays
    @JsonKey(fromJson: _stringList, toJson: _stringListToJson)
    List<String>? images,
    String? brochureUrl,
    bool? isActive,
    int? variantCount,
    PriceRange? priceRange,
    @JsonKey(
        name: 'fuelTypes',
        fromJson: _stringList,
        toJson: _stringListToJson,
        defaultValue: null)
    List<String>? fuelTypes,
    @JsonKey(
        name: 'transmissionTypes',
        fromJson: _stringList,
        toJson: _stringListToJson,
        defaultValue: null)
    List<String>? transmissionTypes,
    bool? isCommercialVehicle,
    String? commercialVehicleType,
    String? commercialBodyType,
    int? defaultPayloadCapacity,
    String? defaultPayloadUnit,
    int? defaultAxleCount,
    int? defaultSeatingCapacity,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}

extension VehicleModelJson on VehicleModel {
  Map<String, dynamic> toJson() => (this as _VehicleModel).toJson();
}

@freezed
class VehicleModelResponse with _$VehicleModelResponse {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleModelResponse({
    required List<VehicleModel> data,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = _VehicleModelResponse;

  factory VehicleModelResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelResponseFromJson(json);
}

extension VehicleModelResponseJson on VehicleModelResponse {
  Map<String, dynamic> toJson() => (this as _VehicleModelResponse).toJson();
}

@freezed
class PriceRange with _$PriceRange {
  const factory PriceRange({
    int? min,
    int? max,
  }) = _PriceRange;

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);
}
