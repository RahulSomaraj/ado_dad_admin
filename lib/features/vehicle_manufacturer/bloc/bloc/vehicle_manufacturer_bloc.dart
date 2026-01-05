import 'dart:async';

import 'package:ado_dad_admin/models/vehicle_manufacturer/vehicle_manufacturer_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_manufacturer_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_manufacturer_event.dart';
part 'vehicle_manufacturer_state.dart';
part 'vehicle_manufacturer_bloc.freezed.dart';

class VehicleManufacturerBloc
    extends Bloc<VehicleManufacturerEvent, VehicleManufacturerState> {
  final VehicleManufacturerRepository repository;
  VehicleManufacturerBloc({required this.repository}) : super(_Initial()) {
    on<FetchAllVehicleManufacturers>(_onFetchAllVehicleManufacturers);
    on<CreateVehicleManufacturer>(_onCreateManufacturer);
    on<UpdateVehicleManufacturer>(_onUpdateManufacturer);
    on<DeleteVehicleManufacturer>(_onDeleteManufacturer);
    on<FetchAllManufacturersForDropdown>(
      (event, emit) => _fetchAllForDropdown(emit),
    );
    on<UploadCsv>(_onUploadCsv);

    // @override
    // Stream<VehicleManufacturerState> mapEventToState(
    //   VehicleManufacturerEvent event,
    // ) async* {
    //   // TODO: implement mapEventToState
  }

  Future<void> _onFetchAllVehicleManufacturers(
    FetchAllVehicleManufacturers event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      final result = await repository.fetchAllManufacturers(
        page: event.page,
        limit: event.limit,
        searchQuery:
            event.searchQuery?.isNotEmpty == true ? event.searchQuery : null,
        category: event.category?.isNotEmpty == true ? event.category : null,
      );
      emit(VehicleManufacturerState.loaded(result));
    } catch (e) {
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }

  Future<void> _onCreateManufacturer(
    CreateVehicleManufacturer event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      print("Payload: ${event.manufacturer.toJson()}");
      await repository.createManufacturer(event.manufacturer);
      final result = await repository.fetchAllManufacturers();
      emit(VehicleManufacturerState.loaded(result));
    } catch (e) {
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }

  Future<void> _onUpdateManufacturer(
    UpdateVehicleManufacturer event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      print("Update Payload: ${event.manufacturer.toJson()}");
      await repository.updateManufacturer(event.manufacturer);
      final result = await repository.fetchAllManufacturers();
      emit(VehicleManufacturerState.loaded(result));
    } catch (e) {
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }

  Future<void> _onDeleteManufacturer(
    DeleteVehicleManufacturer event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      await repository.deleteManufacturer(event.id);
      final result = await repository.fetchAllManufacturers();
      emit(VehicleManufacturerState.loaded(result));
    } catch (e) {
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }

  Future<void> _fetchAllForDropdown(
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      final result =
          await repository.fetchDropDownManufacturers(page: 1, limit: 1000);
      emit(VehicleManufacturerState.dropdownLoaded(result.data));
    } catch (e) {
      emit(VehicleManufacturerState.error(
          "Failed to load manufacturer dropdown list"));
    }
  }

  Future<void> _onUploadCsv(
    UploadCsv event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      print('🔄 Bloc: Starting CSV upload for file: ${event.fileName}');
      await repository.uploadCsv(event.fileBytes, event.fileName);
      print('✅ Bloc: CSV upload successful, fetching manufacturers...');
      final result = await repository.fetchAllManufacturers();
      print('✅ Bloc: Manufacturers fetched successfully');
      emit(VehicleManufacturerState.loaded(result));
    } catch (e, stackTrace) {
      print('❌ Bloc: Error during CSV upload:');
      print('   Error: $e');
      print('   Error Type: ${e.runtimeType}');
      print('   Stack Trace: $stackTrace');
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }
}
