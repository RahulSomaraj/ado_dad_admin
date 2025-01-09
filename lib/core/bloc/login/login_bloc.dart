import 'package:ado_dad_admin/core/bloc/auth/auth_bloc.dart';
import 'package:ado_dad_admin/core/bloc/auth/auth_event.dart';
import 'package:ado_dad_admin/core/bloc/login/login_event.dart';
import 'package:ado_dad_admin/core/bloc/login/login_state.dart';
import 'package:ado_dad_admin/features/repository/login/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc for handling login logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.loginRepository, required this.authBloc})
      : super(LoginInitial()) {
    // Handle login event
    on<LoginWithEmail>((event, emit) async {
      emit(LoginLoading());
      try {
        // Call repository to perform login
        final user = await loginRepository.login(event.loginModel);
        // Emit success state with token
        // Dispatch LoggedIn event to AuthBloc
        authBloc.add(LoggedIn(
          token: user.token,
          refreshToken: user.refreshToken,
        ));

        emit(LoginLoaded(user: user));
      } catch (e) {
        print(e);
        emit(LoginError(message: 'Failed to login: ${e.toString()}'));
      }
    });
  }
}
