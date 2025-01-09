import 'package:ado_dad_admin/core/model/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginWithEmail extends LoginEvent {
  final LoginModel loginModel;

  LoginWithEmail({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}
