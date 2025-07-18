part of 'vehicle_model_bloc.dart';

@freezed
class VehicleModelState with _$VehicleModelState {
  const factory VehicleModelState.initial() = _Initial;
  const factory VehicleModelState.loading() = _Loading;
  const factory VehicleModelState.loaded(
    VehicleModelResponse response,
  ) = _Loaded;
  const factory VehicleModelState.error(String message) = _Error;
}
