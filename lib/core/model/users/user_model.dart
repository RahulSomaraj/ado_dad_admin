import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id') // Ensure correct mapping for MongoDB field names
  final String id;

  final String name;
  final String type;

  @JsonKey(defaultValue: "") // Prevent null issues
  final String phoneNumber;

  @JsonKey(defaultValue: "")
  final String email;

  @JsonKey(defaultValue: "")
  final String otp;

  @JsonKey(name: 'createdAt', fromJson: _fromJson, toJson: _toJson)
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.type,
    required this.phoneNumber,
    required this.email,
    required this.otp,
    required this.createdAt, // Add this
  });

  // Custom DateTime parsing
  static DateTime _fromJson(String date) => DateTime.parse(date);
  static String _toJson(DateTime date) => date.toIso8601String();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
