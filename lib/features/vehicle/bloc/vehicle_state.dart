part of 'vehicle_bloc.dart';

@freezed
class VehicleState with _$VehicleState {
  const factory VehicleState.initial() = VehicleInitial;
  const factory VehicleState.loading() = VehicleLoading;

  const factory VehicleState.loaded({
    //  required List<VehicleModel> vehicles,
    required List<VehicleRequest> vehicles,
    required int totalPages,
    required int currentPage,
  }) = VehicleLoaded;

  const factory VehicleState.error(String message) = VehicleError;
  const factory VehicleState.vehicleAddedSuccess(String message) =
      VehicleAddedSuccess;
  const factory VehicleState.updated() = VehicleUpdated;
  const factory VehicleState.deleted() = VehicleDeleted;
}
