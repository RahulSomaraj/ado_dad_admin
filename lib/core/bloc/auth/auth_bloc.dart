// Bloc
import 'package:ado_dad_admin/core/bloc/auth/auth_event.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_state.dart';
import 'package:ado_dad_admin/features/repository/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final isAuthenticated = await authService.isAuthenticated();
    if (isAuthenticated) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    await authService.saveToken(event.token, event.refreshToken);
    emit(AuthAuthenticated());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await authService.removeToken();
    emit(AuthUnauthenticated());
  }
}
