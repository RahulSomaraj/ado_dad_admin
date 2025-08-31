part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.fetchAllUsers({
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('') String? searchQuery,
  }) = FetchAllUsers;

  const factory UserEvent.addUser({required UserModel userData}) = AddUser;
  const factory UserEvent.addUserWithProfilePic({
    required UserModel userData,
    required Uint8List profilePicBytes,
  }) = AddUserWithProfilePic;

  const factory UserEvent.deleteUser({required String userId}) = DeleteUser;
  const factory UserEvent.updateUser({required UserModel updatedUser}) =
      UpdateUser;
  const factory UserEvent.updateUserWithProfilePic({
    required UserModel updatedUser,
    required Uint8List profilePicBytes,
  }) = UpdateUserWithProfilePic;

  const factory UserEvent.userListNavigation() = UserListNavigation;
}
