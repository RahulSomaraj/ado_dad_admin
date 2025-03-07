part of 'vehicle_company_bloc.dart';

@freezed
class VehicleCompanyState with _$VehicleCompanyState {
  const factory VehicleCompanyState.initial() = VehicleCompanyInitial;
  const factory VehicleCompanyState.loading() = VehicleCompanyLoading;

  const factory VehicleCompanyState.loaded({
    required List<VehicleCompanyModel> companies,
    required int totalPages,
    required int currentPage,
  }) = VehicleCompanyLoaded;
  const factory VehicleCompanyState.error(String message) = VehicleCompanyError;
  const factory VehicleCompanyState.vehicleCompanyAddedSuccess(String message) =
      VehicleCompanyAddedSuccess;
  const factory VehicleCompanyState.updated() = VehicleCompanyUpdated;
  const factory VehicleCompanyState.deleted() = VehicleCompanyDeleted;
}
