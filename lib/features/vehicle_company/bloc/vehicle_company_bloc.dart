import 'package:ado_dad_admin/models/vehicle_company_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_company_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_company_event.dart';
part 'vehicle_company_state.dart';
part 'vehicle_company_bloc.freezed.dart';

class VehicleCompanyBloc
    extends Bloc<VehicleCompanyEvent, VehicleCompanyState> {
  final VehicleCompanyRepository vehicleCompanyRepository;

  VehicleCompanyBloc({required this.vehicleCompanyRepository})
      : super(VehicleCompanyInitial()) {
    on<FetchAllVehicleCompany>(_onFetchAllVehicleCompany);
    on<AddVehicleCompany>(_onAddVehicleCompany);
    on<UpdateVehicleCompany>(_onUpdateVehicleCompany);
    on<DeleteVehicleCompany>(_onDeleteVehicleCompany);
  }

  Future<void> _onFetchAllVehicleCompany(
      FetchAllVehicleCompany event, Emitter<VehicleCompanyState> emit) async {
    emit(const VehicleCompanyState.loading());
    try {
      final companyResponse =
          await VehicleCompanyRepository().fetchAllCompanies(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        searchQuery: event.searchQuery ?? '',
      );
      emit(VehicleCompanyState.loaded(
        companies: companyResponse.companies,
        totalPages: companyResponse.totalPages,
        currentPage: companyResponse.currentPage,
      ));
    } catch (e) {
      emit(VehicleCompanyState.error("Failed to fetch vehicle companies"));
    }
  }

  Future<void> _onAddVehicleCompany(
      AddVehicleCompany event, Emitter<VehicleCompanyState> emit) async {
    emit(const VehicleCompanyState.loading());
    try {
      final responseMessage = await VehicleCompanyRepository()
          .createCompany(event.vehicleCompanyData);
      emit(VehicleCompanyState.vehicleCompanyAddedSuccess(responseMessage));
      add(const FetchAllVehicleCompany());
    } catch (e) {
      emit(VehicleCompanyError(e.toString()));
    }
  }

  Future<void> _onUpdateVehicleCompany(
      UpdateVehicleCompany event, Emitter<VehicleCompanyState> emit) async {
    emit(VehicleCompanyLoading());
    try {
      await VehicleCompanyRepository()
          .updateCompany(event.updatedVehicleCompany);
      emit(const VehicleCompanyState.updated());
      add(FetchAllVehicleCompany(page: 1, limit: 10));
    } catch (e) {
      emit(VehicleCompanyState.error("Failed to update vehicle companies"));
    }
  }

  Future<void> _onDeleteVehicleCompany(
      DeleteVehicleCompany event, Emitter<VehicleCompanyState> emit) async {
    try {
      await VehicleCompanyRepository().deleteCompany(event.companyId);
      add(FetchAllVehicleCompany(page: 1, limit: 10));
    } catch (e) {
      emit(VehicleCompanyError("Failed to delete vehicle company"));
    }
  }
}
