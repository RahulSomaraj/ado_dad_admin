part of 'showroom_bloc.dart';

@freezed
class ShowroomEvent with _$ShowroomEvent {
  const factory ShowroomEvent.started() = _Started;
  const factory ShowroomEvent.fetchAllShowrooms({
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('SR') String? userType,
    @Default('') String? searchQuery,
  }) = FetchAllShowrooms;

  // const factory ShowroomEvent.addShowroom(UserModel showroomData) = AddShowroom;
  const factory ShowroomEvent.addShowroom({required UserModel showroomData}) =
      AddShowroom;
  const factory ShowroomEvent.updateShowroom(
      {required UserModel updatedShowroom}) = UpdateShowroom;
}
