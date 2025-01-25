import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'user_model_pagination.g.dart';

@JsonSerializable()
class UserListPagination {
  final List<UserModel> users;
  final int currentPage;
  final int totalPages;

  UserListPagination({
    required this.users,
    required this.currentPage,
    required this.totalPages,
  });

  factory UserListPagination.fromJson(Map<String, dynamic> json) =>
      UserListPagination(
        users:
            (json['users'] as List<dynamic>) // Explicitly handle List<dynamic>
                .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
                .toList(),
        currentPage: int.tryParse(json['currentPage'].toString()) ?? 1,
        totalPages: int.tryParse(json['totalPages'].toString()) ?? 1,
      );

  Map<String, dynamic> toJson() => _$UserListPaginationToJson(this);
}
