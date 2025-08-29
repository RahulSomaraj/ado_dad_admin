// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'fuel_transmission_models.freezed.dart';
// part 'fuel_transmission_models.g.dart';

// @freezed
// class FuelType with _$FuelType {
//   const factory FuelType({
//     @JsonKey(name: '_id') required String id,
//     required String name, // display label (e.g., "Diesel")
//     required String key, // backend value (e.g., "Diesel")
//   }) = _FuelType;

//   factory FuelType.fromJson(Map<String, dynamic> json) =>
//       _$FuelTypeFromJson(json);
// }

// @freezed
// class TransmissionType with _$TransmissionType {
//   const factory TransmissionType({
//     @JsonKey(name: '_id') required String id,
//     required String name, // display label (e.g., "Automatic")
//     required String key, // backend value (e.g., "Automatic")
//   }) = _TransmissionType;

//   factory TransmissionType.fromJson(Map<String, dynamic> json) =>
//       _$TransmissionTypeFromJson(json);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'fuel_transmission_models.freezed.dart';
part 'fuel_transmission_models.g.dart';

@freezed
class FuelType with _$FuelType {
  const factory FuelType({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? displayName,
    String? abbreviation,
    bool? isActive,
    int? sortOrder,
  }) = _FuelType;

  factory FuelType.fromJson(Map<String, dynamic> json) =>
      _$FuelTypeFromJson(json);
}

@freezed
class TransmissionType with _$TransmissionType {
  const factory TransmissionType({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? displayName,
    String? description,
    String? icon,
    String? abbreviation,
    bool? isActive,
    int? sortOrder,
  }) = _TransmissionType;

  factory TransmissionType.fromJson(Map<String, dynamic> json) =>
      _$TransmissionTypeFromJson(json);
}
