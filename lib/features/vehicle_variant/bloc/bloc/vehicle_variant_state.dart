part of 'vehicle_variant_bloc.dart';

@freezed
class VehicleVariantState with _$VehicleVariantState {
  const factory VehicleVariantState.initial() = _Initial;
  const factory VehicleVariantState.loading() = _Loading;
  // const factory VehicleVariantState.loaded(VariantResponse response) = _Loaded;
  const factory VehicleVariantState.loaded(
    VehicleVariantPaginatedResponse response,
  ) = _Loaded;

  const factory VehicleVariantState.success(String message) = _Success;
  const factory VehicleVariantState.error(String message) = _Error;
}
