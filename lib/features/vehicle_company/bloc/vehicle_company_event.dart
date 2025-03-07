part of 'vehicle_company_bloc.dart';

@freezed
class VehicleCompanyEvent with _$VehicleCompanyEvent {
  const factory VehicleCompanyEvent.started() = _Started;
  const factory VehicleCompanyEvent.fetchAllVehicleCompany({
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('') String? searchQuery,
  }) = FetchAllVehicleCompany;

  const factory VehicleCompanyEvent.addVehicleCompany(
      {required VehicleCompanyModel vehicleCompanyData}) = AddVehicleCompany;

  const factory VehicleCompanyEvent.updateVehicleCompany(
          {required VehicleCompanyModel updatedVehicleCompany}) =
      UpdateVehicleCompany;

  const factory VehicleCompanyEvent.deleteVehicleCompany(
      {required String companyId}) = DeleteVehicleCompany;
}
