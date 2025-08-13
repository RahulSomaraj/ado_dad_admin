import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_manufacturer_model.freezed.dart';
part 'vehicle_manufacturer_model.g.dart';

@freezed
class VehicleManufacturer with _$VehicleManufacturer {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleManufacturer({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String displayName,
    required String originCountry,
    required String description,
    required String logo,
    required String website,
    required int foundedYear,
    required String headquarters,
    required bool isActive,
    // required bool isDeleted,
    // required DateTime createdAt,
    // required DateTime updatedAt,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(0) int v,
  }) = _VehicleManufacturer;

  factory VehicleManufacturer.fromJson(Map<String, dynamic> json) =>
      _$VehicleManufacturerFromJson(json);

  // Map<String, dynamic> toJson() => _$VehicleManufacturerToJson(this);
}

extension VehicleManufacturerJson on VehicleManufacturer {
  Map<String, dynamic> toJson() => (this as _VehicleManufacturer).toJson();
}

@freezed
class VehicleManufacturerResponse with _$VehicleManufacturerResponse {
  @JsonSerializable(explicitToJson: true)
  const factory VehicleManufacturerResponse({
    required List<VehicleManufacturer> data,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = _VehicleManufacturerResponse;

  factory VehicleManufacturerResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleManufacturerResponseFromJson(json);

  // Map<String, dynamic> toJson() => _$VehicleManufacturerResponseToJson(this);
}

extension VehicleManufacturerResponseJson on VehicleManufacturerResponse {
  Map<String, dynamic> toJson() =>
      (this as _VehicleManufacturerResponse).toJson();
}
