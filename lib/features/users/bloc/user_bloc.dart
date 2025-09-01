import 'dart:typed_data';
import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchAllUsers>(_onFetchAllUsers);
    on<DeleteUser>(_onDeleteUser);
    on<UpdateUser>(_onUpdateUser);
    on<AddUser>(_onAddUser);

    on<AddUserWithProfilePic>(_onAddUserWithProfilePic);
    on<UpdateUserWithProfilePic>(_onUpdateUserWithProfilePic);

    on<UserListNavigation>(_onUserListNavigation);
  }

  Future<void> _onFetchAllUsers(
      FetchAllUsers event, Emitter<UserState> emit) async {
    emit(const UserState.loading());

    try {
      final userResponse = await userRepository.fetchAllUsers(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        searchQuery: event.searchQuery ?? '',
      );

      emit(UserState.loaded(
        users: userResponse.users,
        totalPages: userResponse.totalPages,
        currentPage: userResponse.currentPage,
      ));
    } catch (e) {
      emit(UserState.error("Failed to fetch users"));
    }
  }

  Future<void> _onDeleteUser(DeleteUser event, Emitter<UserState> emit) async {
    try {
      await userRepository.deleteUser(event.userId);
      emit(const UserState.userDeletedSuccess("User deleted successfully!"));
      add(FetchAllUsers(page: 1, limit: 10));
    } catch (e) {
      emit(UserError("Failed to delete user"));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await userRepository.updateUser(event.updatedUser);
      emit(const UserState.updated());
    } catch (e) {
      emit(UserState.error("Failed to update user"));
    }
  }

  Future<void> _onAddUser(AddUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      final responseMessage = await userRepository.createUser(event.userData);
      emit(UserState.userAddedSuccess(responseMessage));
      add(const FetchAllUsers());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onAddUserWithProfilePic(
      AddUserWithProfilePic event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    try {
      // Upload profile picture to S3
      final profilePicUrl = await userRepository.uploadImageToS3(
        event.profilePicBytes,
        'profilePic_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (profilePicUrl == null) {
        throw Exception("Failed to upload profile picture");
      }

      // Create user with profile picture URL
      final userWithProfilePic =
          event.userData.copyWith(profilePic: profilePicUrl);
      final responseMessage =
          await userRepository.createUser(userWithProfilePic);
      emit(UserState.userAddedSuccess(responseMessage));
      add(const FetchAllUsers());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateUserWithProfilePic(
      UpdateUserWithProfilePic event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      // Upload profile picture to S3
      final profilePicUrl = await userRepository.uploadImageToS3(
        event.profilePicBytes,
        'profilePic_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (profilePicUrl == null) {
        throw Exception("Failed to upload profile picture");
      }

      // Update user with profile picture URL
      final userWithProfilePic =
          event.updatedUser.copyWith(profilePic: profilePicUrl);
      await userRepository.updateUser(userWithProfilePic);
      emit(const UserState.updated());
    } catch (e) {
      emit(UserState.error("Failed to update user"));
    }
  }

  Future<void> _onUserListNavigation(
      UserListNavigation event, Emitter<UserState> emit) async {
    emit(UserListNavigated());
  }
}
