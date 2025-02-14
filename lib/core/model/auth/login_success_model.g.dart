// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSuccessModel _$LoginSuccessModelFromJson(Map<String, dynamic> json) =>
    LoginSuccessModel(
      id: json['id'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$LoginSuccessModelToJson(LoginSuccessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'userName': instance.userName,
      'email': instance.email,
      'userType': instance.userType,
    };
