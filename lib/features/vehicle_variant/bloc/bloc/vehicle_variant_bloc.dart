import 'dart:async';

import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart'
    hide FuelType, TransmissionType;
import 'package:ado_dad_admin/repositories/vehicle_variant_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_variant_event.dart';
part 'vehicle_variant_state.dart';
part 'vehicle_variant_bloc.freezed.dart';

class VehicleVariantBloc
    extends Bloc<VehicleVariantEvent, VehicleVariantState> {
  final VehicleVariantRepository repository;

  VehicleVariantBloc({required this.repository}) : super(_Initial()) {
    on<FetchVariantsByModel>(_onFetchByModel);
    on<CreateVariant>(_onCreateVariant);
    on<UploadVariantCsv>(_onUploadVariantCsv);
    on<UpdateVariant>(_onUpdateVariant);
    on<DeleteVariant>(_onDeleteVariant);
    on<FetchOptions>(_onFetchOptions);
  }

  Future<void> _onFetchByModel(
    FetchVariantsByModel event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      final response = await repository.fetchVariantsByModel(
        modelId: event.modelId,
        page: event.page,
        limit: event.limit,
      );
      emit(VehicleVariantState.loaded(response));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }

  Future<void> _onCreateVariant(
    CreateVariant event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      await repository.createVariant(event.variant);
      emit(const VehicleVariantState.success("Variant created successfully."));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }

  Future<void> _onUploadVariantCsv(
    UploadVariantCsv event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      await repository.uploadVariantCsv(
          event.modelId, event.fileBytes, event.fileName);

      final variants = await repository.fetchVariantsByModel(
        modelId: event.modelId,
        page: 1,
        limit: 10,
      );

      emit(VehicleVariantState.loaded(variants));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }

  Future<void> _onUpdateVariant(
    UpdateVariant event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      await repository.updateVariant(event.variantId, event.payload);
      final variants = await repository.fetchVariantsByModel(
        modelId: event.modelId,
        page: 1,
        limit: 10,
      );
      emit(VehicleVariantState.loaded(variants));
      await Future.delayed(const Duration(milliseconds: 100));
      emit(const VehicleVariantState.success("Variant updated successfully."));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }

  Future<void> _onDeleteVariant(
    DeleteVariant event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      await repository.deleteVariant(event.variantId);
      final variants = await repository.fetchVariantsByModel(
        modelId: event.modelId,
        page: 1,
        limit: 10,
      );
      emit(VehicleVariantState.loaded(variants));
      await Future.delayed(const Duration(milliseconds: 100));
      emit(const VehicleVariantState.success("Variant deleted successfully."));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }

  Future<void> _onFetchOptions(
    FetchOptions event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      final results = await Future.wait([
        repository.fetchFuelTypes(),
        repository.fetchTransmissionTypes(),
      ]);
      emit(VehicleVariantState.optionsLoaded(
        fuelTypes: results[0] as List<FuelType>,
        transmissionTypes: results[1] as List<TransmissionType>,
      ));
    } catch (e) {
      emit(VehicleVariantState.error(e.toString()));
    }
  }
}
