part of 'vehicle_model_bloc.dart';

@freezed
class VehicleModelEvent with _$VehicleModelEvent {
  const factory VehicleModelEvent.started() = _Started;
  const factory VehicleModelEvent.fetchAllModels({
    @Default(1) int page,
    @Default(10) int limit,
    @Default('') String? searchQuery,
  }) = FetchAllVehicleModels;
  // const factory VehicleModelEvent.createVehicleModel(VehicleModel model) =
  //     CreateVehicleModel;
  const factory VehicleModelEvent.createVehicleModel({
    required VehicleModel model,
    required List<PlatformFile> rawImages,
  }) = CreateVehicleModel;
  const factory VehicleModelEvent.fetchByManufacturer(
    String manufacturerId, {
    @Default(1) int page,
    @Default(10) int limit,
  }) = FetchVehicleModelsByManufacturer;
}
