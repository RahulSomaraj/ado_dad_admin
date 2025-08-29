part of 'vehicle_model_bloc.dart';

@freezed
class VehicleModelState with _$VehicleModelState {
  const factory VehicleModelState.initial() = _Initial;
  const factory VehicleModelState.loading() = _Loading;
  const factory VehicleModelState.loaded(
    VehicleModelResponse response,
  ) = _Loaded;
  const factory VehicleModelState.error(String message) = _Error;
  const factory VehicleModelState.optionsLoaded({
    required List<FuelType> fuelTypes,
    required List<TransmissionType> transmissionTypes,
  }) = _OptionsLoaded;
  const factory VehicleModelState.oneLoaded(VehicleModel model) = _OneLoaded;
  // success markers (NEW)
  const factory VehicleModelState.created() = _Created;
  const factory VehicleModelState.updated() = _Updated;
}
