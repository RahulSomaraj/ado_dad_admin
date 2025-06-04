part of 'vehicle_bloc.dart';

@freezed
class VehicleEvent with _$VehicleEvent {
  const factory VehicleEvent.started() = _Started;
  const factory VehicleEvent.fetchAllVehicles({
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('') String? searchQuery,
  }) = FetchAllVehicles;

  const factory VehicleEvent.addVehicle({required VehicleRequest vehicleData}) =
      AddVehicle;

  const factory VehicleEvent.updateVehicleCompany(
      {required VehicleRequest updatedVehicle}) = UpdateVehicle;

  const factory VehicleEvent.deleteVehicle({required String vehicleId}) =
      DeleteVehicle;
}
