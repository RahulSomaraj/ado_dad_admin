import 'package:json_annotation/json_annotation.dart';

part 'login_success_model.g.dart';

@JsonSerializable()
class LoginSuccessModel {
  final String id;
  final String token;
  final String refreshToken;
  final String userName;
  final String email;
  final String userType;

  LoginSuccessModel({
    required this.id,
    required this.token,
    required this.refreshToken,
    required this.userName,
    required this.email,
    required this.userType,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSuccessModelToJson(this);
}
