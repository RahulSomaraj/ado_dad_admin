import 'package:ado_dad_admin/core/model/login_success_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginSuccessModel user;
  LoginLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});

  @override
  List<Object?> get props => [message];
}
