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

  // Future<void> _onCreateVehicleModel(
  //   CreateVehicleModel event,
  //   Emitter<VehicleModelState> emit,
  // ) async {
  //   emit(const VehicleModelState.loading());
  //   try {
  //     // 1. Upload images to S3
  //     final uploadedUrls = await repository.uploadImagesToS3(event.rawImages);

  //     // 2. Create new VehicleModel with URLs
  //     final modelWithImages = event.model.copyWith(images: uploadedUrls);

  //     print('modelWithImages: $modelWithImages');

  //     // 3. Post to backend
  //     await repository.createVehicleModel(modelWithImages);

  //     // 4. Refresh model list
  //     final result = await repository.fetchAllModels();
  //     emit(VehicleModelState.loaded(result));
  //   } catch (e) {
  //     emit(VehicleModelState.error(e.toString()));
  //   }
  // }

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
}
