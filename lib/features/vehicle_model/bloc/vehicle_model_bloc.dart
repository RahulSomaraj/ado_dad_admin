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
    on<UploadCsv>(_onUploadCsv);
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
      final uploadedUrls = await repository.uploadImagesToS3(event.rawImages);
      final modelWithImages = event.model.copyWith(images: uploadedUrls);
      await repository.createVehicleModel(modelWithImages);
      emit(const VehicleModelState.created());
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
        page: event.page,
        limit: event.limit,
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
      final uploadedNewUrls = event.newRawImages.isEmpty
          ? <String>[]
          : await repository.uploadImagesToS3(event.newRawImages);

      final mergedImages = <String>[
        ...event.keepImageUrls,
        ...uploadedNewUrls,
      ];

      final updated = event.model.copyWith(images: mergedImages);
      await repository.updateVehicleModel(updated);
      emit(const VehicleModelState.updated());

      final refreshed = await repository.fetchAllModels();
      emit(VehicleModelState.loaded(refreshed));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }

  Future<void> _onUploadCsv(
    UploadCsv event,
    Emitter<VehicleModelState> emit,
  ) async {
    emit(const VehicleModelState.loading());
    try {
      await repository.uploadCsv(
          event.manufacturerId, event.fileBytes, event.fileName);

      final manufacturerModels = await repository.fetchModelsByManufacturer(
        event.manufacturerId,
        page: 1,
        limit: 10,
      );

      emit(VehicleModelState.loaded(manufacturerModels));
    } catch (e) {
      emit(VehicleModelState.error(e.toString()));
    }
  }
}
