part of 'vehicle_variant_bloc.dart';

@freezed
class VehicleVariantEvent with _$VehicleVariantEvent {
  const factory VehicleVariantEvent.started() = _Started;
  const factory VehicleVariantEvent.fetchAll({
    @Default(1) int page,
    @Default(10) int limit,
    String? searchQuery,
  }) = FetchAllVariants;

  const factory VehicleVariantEvent.fetchByModel({
    required String modelId,
    @Default(1) int page,
    @Default(10) int limit,
  }) = FetchVariantsByModel;

  const factory VehicleVariantEvent.createVariant({
    required VariantModel variant,
  }) = CreateVariant;
}
