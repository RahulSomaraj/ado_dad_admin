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
    // on<FetchAllVariants>(_onFetchAll);
    on<FetchVariantsByModel>(_onFetchByModel);
    on<CreateVariant>(_onCreateVariant);
    on<UploadVariantCsv>(_onUploadVariantCsv);
    on<FetchOptions>(_onFetchOptions);
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

  Future<void> _onUploadVariantCsv(
    UploadVariantCsv event,
    Emitter<VehicleVariantState> emit,
  ) async {
    emit(const VehicleVariantState.loading());
    try {
      print('🔄 Bloc: Starting Variant CSV upload for model: ${event.modelId}');
      await repository.uploadVariantCsv(
          event.modelId, event.fileBytes, event.fileName);
      print('✅ Bloc: Variant CSV upload successful, fetching variants...');

      // Fetch variants by model after successful upload
      final variants = await repository.fetchVariantsByModel(
        modelId: event.modelId,
        page: 1,
        limit: 10,
      );
      print('✅ Bloc: Variants fetched successfully');
      print('📋 Variant List after CSV upload:');
      print('   Total variants: ${variants.data.length}');
      print('   Total pages: ${variants.totalPages}');
      print('   Total count: ${variants.total}');
      for (int i = 0; i < variants.data.length; i++) {
        final variant = variants.data[i];
        print('   Variant ${i + 1}:');
        print('      ID: ${variant.id}');
        print('      Name: ${variant.name}');
        print('      Display Name: ${variant.displayName}');
        print('      Fuel Type: ${variant.fuelType?.displayName ?? "N/A"}');
        print(
            '      Transmission: ${variant.transmissionType?.displayName ?? "N/A"}');
        print('      Price: ₹${variant.price ?? "N/A"}');
        print('      Is Active: ${variant.isActive}');
        print('      Feature Package: ${variant.featurePackage ?? "N/A"}');
        print('      Seating Capacity: ${variant.seatingCapacity ?? "N/A"}');
      }
      print('📋 Full Variant List Summary:');
      print(
          '   ${variants.data.map((v) => '${v.displayName} (${v.name})').join(', ')}');

      // Emit the loaded state with updated variants
      emit(VehicleVariantState.loaded(variants));
    } catch (e, stackTrace) {
      print('❌ Bloc: Error during Variant CSV upload:');
      print('   Error: $e');
      print('   Error Type: ${e.runtimeType}');
      print('   Stack Trace: $stackTrace');
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
