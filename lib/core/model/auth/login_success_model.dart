import 'package:json_annotation/json_annotation.dart';

part 'login_success_model.g.dart';

@JsonSerializable()
class LoginSuccessModel {
  String message;
  String token;
  String refreshToken;
  String name;
  String phoneNumber;
  String email;
  String profilePicture;

  LoginSuccessModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.profilePicture,
    required this.refreshToken,
    required this.message,
    required this.token
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSuccessModelToJson(this);
}
