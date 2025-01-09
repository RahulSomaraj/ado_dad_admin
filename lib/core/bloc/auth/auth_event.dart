import 'package:equatable/equatable.dart';

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;
  final String refreshToken;
  LoggedIn({
    required this.token,
    required this.refreshToken,
  });
}

class LoggedOut extends AuthEvent {}
