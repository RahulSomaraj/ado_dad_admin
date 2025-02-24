class UserModel {
  final String id;
  final String? profilePic;
  final String type;
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final String username;
  final bool isDeleted;
  final String otp;
  final DateTime otpExpires;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    this.profilePic,
    required this.type,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.username,
    required this.isDeleted,
    required this.otp,
    required this.otpExpires,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      profilePic: json['profilePic'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      username: json['username'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      otp: json['otp'] ?? '',
      otpExpires: json['otpExpires'] != null
          ? DateTime.parse(json['otpExpires'])
          : DateTime.now(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'profilePic': profilePic,
      'type': type,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'username': username,
      'isDeleted': isDeleted,
      'otp': otp,
      'otpExpires': otpExpires.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class UserResponse {
  final List<UserModel> users;
  final int totalPages;
  final int currentPage;

  UserResponse({
    required this.users,
    required this.totalPages,
    required this.currentPage,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      users: (json['users'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList(),
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['currentPage'] ?? 1,
    );
  }
}
