part of 'showroom_bloc.dart';

@freezed
class ShowroomState with _$ShowroomState {
  const factory ShowroomState.initial() = ShowroomInitial;
  const factory ShowroomState.loading() = ShowroomLoading;

  const factory ShowroomState.loaded({
    required List<UserModel> showroomusers,
    required int totalPages,
    required int currentPage,
  }) = ShowroomLoaded;
  const factory ShowroomState.error(String message) = ShowroomError;

  const factory ShowroomState.addingShowroom() = AddingShowroom;
  const factory ShowroomState.showroomAddedSuccess(String message) =
      ShowroomAddedSuccess;

  const factory ShowroomState.updated() = ShowroomUpdated;
}
