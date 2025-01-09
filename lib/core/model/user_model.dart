import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String type;
  final String phoneNumber;
  final String email;
  final String otp;

  UserModel({
    required this.id,
    required this.name,
    required this.type,
    required this.phoneNumber,
    required this.otp,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
