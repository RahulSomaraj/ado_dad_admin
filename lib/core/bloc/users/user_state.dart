import 'package:ado_dad_admin/core/model/user_model.dart';
import 'package:ado_dad_admin/core/model/user_model_pagination.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserListPagination users;

  UserLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserFetched extends UserState {
  final UserModel user;

  UserFetched({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserCreated extends UserState {
  final UserModel user;

  UserCreated({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserUpdated extends UserState {
  final UserModel user;

  UserUpdated({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserDeleted extends UserState {
  final int userId;

  UserDeleted({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});

  @override
  List<Object?> get props => [message];
}
