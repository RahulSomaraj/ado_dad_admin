// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSuccessModel _$LoginSuccessModelFromJson(Map<String, dynamic> json) =>
    LoginSuccessModel(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
      refreshToken: json['refreshToken'] as String,
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginSuccessModelToJson(LoginSuccessModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
    };
