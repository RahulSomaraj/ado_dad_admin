// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'otp': instance.otp,
    };
