import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@freezed
class VehicleModel with _$VehicleModel {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleModel({
    @JsonKey(name: '_id') String? id,
    required String name,
    required String displayName,
    required VehicleManufacturer manufacturer,
    required String vehicleType,
    String? description,
    int? launchYear,
    String? segment,
    String? bodyType,
    List<String>? images,
    String? brochureUrl,
    bool? isActive,
    int? variantCount,
    PriceRange? priceRange,
    List<String>? availableFuelTypes,
    List<String>? availableTransmissionTypes,
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
