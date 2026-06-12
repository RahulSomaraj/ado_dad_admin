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
    on<FetchAllManufacturersForDropdown>(_fetchAllForDropdown);
    on<UploadCsv>(_onUploadCsv);
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
    FetchAllManufacturersForDropdown event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    if (!event.loadMore) {
      emit(const VehicleManufacturerState.loading());
    }

    try {
      final result = await repository.fetchDropDownManufacturers(
        page: event.page,
        limit: event.limit,
        searchQuery: event.searchQuery,
      );

      if (event.loadMore) {
        final currentState = state;
        if (currentState is _DropdownLoaded) {
          final existingData =
              List<VehicleManufacturer>.from(currentState.data);
          final existingIds = existingData.map((m) => m.id).toSet();
          final newItems =
              result.data.where((m) => !existingIds.contains(m.id)).toList();
          existingData.addAll(newItems);
          emit(VehicleManufacturerState.dropdownLoaded(
            existingData,
            result.page,
            result.hasNext,
          ));
        } else {
          emit(VehicleManufacturerState.dropdownLoaded(
            List<VehicleManufacturer>.from(result.data),
            result.page,
            result.hasNext,
          ));
        }
      } else {
        emit(VehicleManufacturerState.dropdownLoaded(
          List<VehicleManufacturer>.from(result.data),
          result.page,
          result.hasNext,
        ));
      }
    } catch (e) {
      emit(VehicleManufacturerState.error(
          "Failed to load manufacturer dropdown list: ${e.toString()}"));
    }
  }

  Future<void> _onUploadCsv(
    UploadCsv event,
    Emitter<VehicleManufacturerState> emit,
  ) async {
    emit(const VehicleManufacturerState.loading());
    try {
      await repository.uploadCsv(event.fileBytes, event.fileName);
      final result = await repository.fetchAllManufacturers();
      emit(VehicleManufacturerState.loaded(result));
    } catch (e) {
      emit(VehicleManufacturerState.error(e.toString()));
    }
  }
}
