import 'package:ado_dad_admin/models/vehicle_model/fuel_transmission_models.dart';
import 'package:ado_dad_admin/models/vehicle_model/vehicle_model.dart';
import 'package:ado_dad_admin/repositories/vehicle_model_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_event.dart';
part 'vehicle_model_state.dart';
part 'vehicle_model_bloc.freezed.dart';

class VehicleModelBloc extends Bloc<VehicleModelEvent, VehicleModelState> {
  final VehicleModelRepository repository;
  VehicleModelBloc({required this.repository})
      : super(const VehicleModelState.initial()) {
    on<FetchAllVehicleModels>(_onFetchAllVehicleModels);
    on<CreateVehicleModel>(_onCreateVehicleModel);
    on<FetchVehicleModelsByManufacturer>(_onFetchByManufacturer);
    on<FetchVehicleOptions>(_onFetchVehicleOptions);
    on<FetchOneVehicleModel>(_onFetchOne);
    on<UpdateVehicleModel>(_onUpdateVehicleModel);
  }

  Future<void> _onFetchAllVehicleModels(
    FetchAllVehicleModels event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      final result = await repository.fetchAllModels(
        page: event.page,
        limit: event.limit,
        searchQuery: event.searchQuery ?? '',
      );
      emit(VehicleModelState.loaded(result));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onCreateVehicleModel(
    CreateVehicleModel event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      // 1. Upload images to S3
      final uploadedUrls = await repository.uploadImagesToS3(event.rawImages);

      // 2. Update model with uploaded image URLs
      final modelWithImages = event.model.copyWith(images: uploadedUrls);

      print('📦 Final Vehicle Model payload: ${modelWithImages.toJson()}');

      // 3. Post to backend
      await repository.createVehicleModel(modelWithImages);
      emit(const VehicleModelState.created()); // << success signal

      // 4. Refresh model list
      final result = await repository.fetchAllModels();
      emit(VehicleModelState.loaded(result));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onFetchByManufacturer(
    FetchVehicleModelsByManufacturer event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      final result = await repository.fetchModelsByManufacturer(
        event.manufacturerId,
      );
      emit(VehicleModelState.loaded(result));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onFetchVehicleOptions(
    FetchVehicleOptions event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      final results = await Future.wait([
        repository.fetchFuelTypes(),
        repository.fetchTransmissionTypes(),
      ]);
      emit(VehicleModelState.optionsLoaded(
        fuelTypes: results[0] as List<FuelType>,
        transmissionTypes: results[1] as List<TransmissionType>,
      ));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onFetchOne(
    FetchOneVehicleModel event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      final model = await repository.fetchModelById(event.id);
      emit(VehicleModelState.oneLoaded(model));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onUpdateVehicleModel(
    UpdateVehicleModel event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      // 1) Upload only newly added files
      final uploadedNewUrls = event.newRawImages.isEmpty
          ? <String>[]
          : await repository.uploadImagesToS3(event.newRawImages);

      // 2) Merge: keep existing (remaining) + newly uploaded
      final mergedImages = <String>[
        ...event.keepImageUrls,
        ...uploadedNewUrls,
      ];

      // 3) Update model with merged images
      final updated = event.model.copyWith(images: mergedImages);

      // 4) PUT update
      await repository.updateVehicleModel(updated);
      emit(const VehicleModelState.updated()); // << success signal

      // 5) Refresh list after update
      final refreshed = await repository.fetchAllModels();
      emit(VehicleModelState.loaded(refreshed));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }
}
