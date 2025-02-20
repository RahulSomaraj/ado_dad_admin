import 'package:ado_dad_admin/common/temp_storage.dart';
import 'package:ado_dad_admin/repositories/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiService authService;

  AuthBloc({required this.authService}) : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final response = await authService.login(event.username, event.password);

      if (response.token != null && response.refreshToken != null) {
        await saveLoginResponse(response);
        emit(AuthState.authenticated());
      } else {
        throw Exception("Invalid login response");
      }
    } catch (e, stackTrace) {
      emit(const AuthState.failure("Invalid username or password"));
    }
  }

  // on<AuthEvent>((event, emit) async {
  //   await event.map(
  //     login: (e) async {
  //       emit(const AuthState.loading());

  //       final response =
  //           await authService.login(e.username, e.password);

  //             if (response.token != null && response.refreshToken != null) {
  //         await saveLoginResponse(response);
  //         emit(AuthState.authenticated(response));
  //       } else {
  //         throw Exception("Invalid login response");
  //       }

  //       await Future.delayed(const Duration(seconds: 2));

  //       if (e.username == "admin" && e.password == "password") {
  //         emit(const AuthState.success());
  //       } else {
  //         emit(const AuthState.failure("Invalid username or password"));
  //       }
  //     },
  //     logout: (_) async {
  //       emit(const AuthState.initial());
  //     },
  //   );
  // });
}
