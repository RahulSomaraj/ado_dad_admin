import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Fetch users with optional pagination support
class FetchUsers extends UserEvent {
  final int page;
  final int limit;

  FetchUsers({this.page = 0, this.limit = 10});

  @override
  List<Object?> get props => [page, limit];
}

// Create a new user
class CreateUser extends UserEvent {
  final Map<String, dynamic> userData;

  CreateUser({required this.userData});

  @override
  List<Object?> get props => [userData];
}

// Update an existing user
class UpdateUser extends UserEvent {
  final int userId;
  final Map<String, dynamic> updatedData;

  UpdateUser({required this.userId, required this.updatedData});

  @override
  List<Object?> get props => [userId, updatedData];
}

// Delete an existing user
class DeleteUser extends UserEvent {
  final int userId;

  DeleteUser({required this.userId});

  @override
  List<Object?> get props => [userId];
}
