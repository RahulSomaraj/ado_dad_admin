part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String username,
    required String password,
  }) = Login;

  const factory AuthEvent.checkLoginStatus() = CheckLoginStatus;

  const factory AuthEvent.logout() = Logout;
}
