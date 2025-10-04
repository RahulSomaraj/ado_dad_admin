import 'dart:async';

import 'package:ado_dad_admin/models/vehicle_variant/variant_model.dart';
import 'package:ado_dad_admin/models/vehicle_variant/vehicle_variant_response_model.dart';
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
    // on<FetchAllVariants>(_onFetchAll);
    on<FetchVariantsByModel>(_onFetchByModel);
    on<CreateVariant>(_onCreateVariant);
  }

  // Future<void> _onFetchAll(
  //   FetchAllVariants event,
  //   Emitter<VehicleVariantState> emit,
  // ) async {
  //   emit(const VehicleVariantState.loading());
  //   try {
  //     final response = await repository.fetchAllVariants(
  //       page: event.page,
  //       limit: event.limit,
  //       searchQuery: event.searchQuery,
  //     );
  //     emit(VehicleVariantState.loaded(response));
  //   } catch (e) {
  //     emit(VehicleVariantState.error(e.toString()));
  //   }
  // }

  // Future<void> _onFetchByModel(
  //   FetchVariantsByModel event,
  //   Emitter<VehicleVariantState> emit,
  // ) async {
  //   emit(const VehicleVariantState.loading());
  //   try {
  //     final response = await repository.fetchVariantsByModel(
  //       modelId: event.modelId,
  //       page: event.page,
  //       limit: event.limit,
  //     );
  //     print("📡 Bloc received response: ${response}");
  //     print("✅ FetchVariantsByModel success: variants=${response.data.length}");
  //     emit(VehicleVariantState.loaded(response));
  //   } catch (e) {
  //     print("❌ Bloc error: $e");
  //     emit(VehicleVariantState.error(e.toString()));
  //   }
  // }

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
      print("✅ Variants fetched: ${response.data.length}");
      emit(VehicleVariantState.loaded(response));
    } catch (e) {
      print("❌ Bloc error: $e");
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
}
