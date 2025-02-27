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
      add(FetchAllUsers(page: 1, limit: 10));
    } catch (e) {
      emit(UserState.error("Failed to update user"));
    }
  }

  Future<void> _onUserListNavigation(
      UserListNavigation event, Emitter<UserState> emit) async {
    emit(UserListNavigated());
  }
}
