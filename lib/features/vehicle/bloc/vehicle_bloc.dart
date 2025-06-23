import 'dart:async';
import 'package:ado_dad_admin/models/vehicle_post_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';
part 'vehicle_bloc.freezed.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository vehicleRepository;
  VehicleBloc({required this.vehicleRepository}) : super(VehicleInitial()) {
    on<FetchAllVehicles>(_onFetchAllVehicles);
    on<AddVehicle>(_onAddVehicle);
    on<UpdateVehicle>(_onUpdateVehicle);
    on<DeleteVehicle>(_onDeleteVehicle);
  }

  Future<void> _onFetchAllVehicles(
      FetchAllVehicles event, Emitter<VehicleState> emit) async {
    emit(const VehicleState.loading());

    try {
      final vehicleResponse = await vehicleRepository.fetchAllVehicles(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        searchQuery: event.searchQuery ?? '',
      );

      emit(VehicleState.loaded(
        vehicles: vehicleResponse,
        totalPages: (vehicleResponse.length / (event.limit ?? 10)).ceil(),
        currentPage: event.page ?? 1,
      ));
    } catch (e) {
      emit(VehicleState.error("Failed to fetch vehicles"));
    }
  }

  Future<void> _onAddVehicle(
      AddVehicle event, Emitter<VehicleState> emit) async {
    emit(const VehicleState.loading());
    try {
      print(
          'bloc wheeler type:...........?????????????${event.vehicleData.wheelerType}');
      final responseMessage =
          await vehicleRepository.createVehicle(event.vehicleData);
      emit(VehicleState.vehicleAddedSuccess(responseMessage));
      add(const FetchAllVehicles());
    } catch (e) {
      emit(VehicleError(e.toString()));
    }
  }

  Future<void> _onUpdateVehicle(
      UpdateVehicle event, Emitter<VehicleState> emit) async {
    emit(VehicleLoading());
    try {
      await VehicleRepository().updateVehicle(event.updatedVehicle);
      emit(const VehicleState.updated());
      add(FetchAllVehicles(page: 1, limit: 10));
    } catch (e) {
      emit(VehicleState.error("Failed to update vehicle"));
    }
  }

  Future<void> _onDeleteVehicle(
      DeleteVehicle event, Emitter<VehicleState> emit) async {
    try {
      // print(event.vehicleId);
      await vehicleRepository.deleteVehicle(event.vehicleId); // ✅
      emit(const VehicleState.deleted());
      add(FetchAllVehicles(page: 1, limit: 10));
    } catch (e) {
      emit(VehicleError("Failed to delete vehicle"));
    }
  }
}
