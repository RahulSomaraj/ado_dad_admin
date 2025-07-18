part of 'vehicle_manufacturer_bloc.dart';

@freezed
class VehicleManufacturerEvent with _$VehicleManufacturerEvent {
  const factory VehicleManufacturerEvent.started() = _Started;
  const factory VehicleManufacturerEvent.fetchAll({
    @Default(1) int page,
    @Default(10) int limit,
    @Default('') String? searchQuery,
  }) = FetchAllVehicleManufacturers;
  const factory VehicleManufacturerEvent.createManufacturer(
    VehicleManufacturer manufacturer,
  ) = CreateVehicleManufacturer;
  const factory VehicleManufacturerEvent.updateManufacturer(
    VehicleManufacturer manufacturer,
  ) = UpdateVehicleManufacturer;
  const factory VehicleManufacturerEvent.deleteManufacturer(String id) =
      DeleteVehicleManufacturer;
  const factory VehicleManufacturerEvent.fetchAllForDropdown() =
      FetchAllManufacturersForDropdown;
}
