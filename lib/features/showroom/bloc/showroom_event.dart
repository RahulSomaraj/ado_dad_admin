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
  const factory ShowroomEvent.addShowroomWithProfilePic({
    required UserModel showroomData,
    required Uint8List profilePicBytes,
  }) = AddShowroomWithProfilePic;
  const factory ShowroomEvent.updateShowroom(
      {required UserModel updatedShowroom}) = UpdateShowroom;
  const factory ShowroomEvent.updateShowroomWithProfilePic({
    required UserModel updatedShowroom,
    required Uint8List profilePicBytes,
  }) = UpdateShowroomWithProfilePic;
  const factory ShowroomEvent.fetchCurrentUserShowroom() =
      FetchCurrentUserShowroom;
}
