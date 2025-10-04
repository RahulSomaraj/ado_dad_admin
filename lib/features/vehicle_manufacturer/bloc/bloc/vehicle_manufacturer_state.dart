part of 'vehicle_manufacturer_bloc.dart';

@freezed
class VehicleManufacturerState with _$VehicleManufacturerState {
  const factory VehicleManufacturerState.initial() = _Initial;
  const factory VehicleManufacturerState.loading() = _Loading;
  const factory VehicleManufacturerState.loaded(
    VehicleManufacturerResponse response,
  ) = _Loaded;
  const factory VehicleManufacturerState.error(String message) = _Error;
  const factory VehicleManufacturerState.dropdownLoaded(
      List<VehicleManufacturer> data) = _DropdownLoaded;
}
