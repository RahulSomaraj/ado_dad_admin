import 'package:ado_dad_admin/core/bloc/users/user_event.dart';
import 'package:ado_dad_admin/core/bloc/users/user_state.dart';
import 'package:ado_dad_admin/core/repository/users/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers(
          page: event.page, limit: event.limit,
          additionalParams: event.queryParams, // Pass optional query parameters
        );
        emit(UserLoaded(users: users));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });

    on<FetchUserById>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.fetchUserById(event.userId);
        emit(UserFetched(user: user));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });

    on<CreateUser>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.createUser(event.userData);
        emit(UserCreated(user: user));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });

    on<UpdateUser>((event, emit) async {
      emit(UserLoading());
      try {
        if (event.updatedData.isEmpty) {
          throw Exception('Updated data cannot be empty.');
        }

        final user =
            await userRepository.updateUser(event.userId, event.updatedData);

        emit(UserUpdated(user: user));
      } catch (e) {
        print('Update Error: $e');
        emit(UserError(message: e.toString()));
      }
    });

    on<DeleteUser>((event, emit) async {
      emit(UserLoading());
      try {
        await userRepository.deleteUser(event.userId);
        emit(UserDeleted(userId: event.userId));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
