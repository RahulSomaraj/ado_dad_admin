import 'package:ado_dad_admin/common/data_storage.dart';
import 'package:ado_dad_admin/repositories/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiService authService;

  AuthBloc({required this.authService}) : super(const AuthState.initial()) {
    on<Login>(_onLogin);
    on<Logout>(_onLogout);
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final response = await authService.login(event.username, event.password);

      if (response.token != null && response.refreshToken != null) {
        emit(AuthState.success(
            username: response.userName, userType: response.userType));
      } else {
        emit(const AuthState.failure("Invalid Username or Password"));
      }
    } catch (e) {
      emit(AuthState.failure('Invalid Username or Password'));
    }
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    print("hiiiiiiii");
    await clearUserData();

    final tokenamen = await getUserName();

    print(tokenamen);

    emit(const AuthState.initial());
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event, Emitter<AuthState> emit) async {
    final String? username = await getUserName();
    final String? userType = await getUserUserType();

    if (username != null && userType != null) {
      emit(AuthState.success(username: username, userType: userType));
    } else {
      emit(const AuthState.initial());
    }
  }
}
