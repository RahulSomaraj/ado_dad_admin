// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListPagination _$UserListPaginationFromJson(Map<String, dynamic> json) =>
    UserListPagination(
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$UserListPaginationToJson(UserListPagination instance) =>
    <String, dynamic>{
      'users': instance.users,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };
