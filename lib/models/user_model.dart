class UserModel {
  final String id;
  final String? profilePic;
  final String? type;
  final String name; // ✅ Ensure `name` is always non-null
  final String phoneNumber; // ✅ Ensure `phoneNumber` is always non-null
  final String email; // ✅ Ensure `email` is always non-null
  final String? password;
  final String? username;
  final bool? isDeleted;
  final String? otp;
  final DateTime? otpExpires;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    this.profilePic,
    this.type,
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.password,
    this.username,
    this.isDeleted,
    this.otp,
    this.otpExpires,
    this.createdAt,
    this.updatedAt,
  });

  /// ✅ Fix: Handle `null` values properly
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      profilePic: json['profilePic'],
      type: json['type'],
      name: json['name'] ?? '', // ✅ Use `?? ''` to avoid null assignment errors
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      username: json['username'],
      isDeleted: json['isDeleted'],
      otp: json['otp'],
      otpExpires: json['otpExpires'] != null
          ? DateTime.tryParse(json['otpExpires'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  /// ✅ Fix: `toJson()` only includes non-null values
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id.isNotEmpty) data['_id'] = id;
    if (profilePic != null) data['profilePic'] = profilePic;
    if (type != null) data['type'] = type;
    data['name'] = name; // ✅ Always send `name` (non-null)
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    if (password != null) data['password'] = password;
    if (username != null) data['username'] = username;
    if (isDeleted != null) data['isDeleted'] = isDeleted;
    if (otp != null) data['otp'] = otp;
    if (otpExpires != null) data['otpExpires'] = otpExpires!.toIso8601String();
    if (createdAt != null) data['createdAt'] = createdAt!.toIso8601String();
    if (updatedAt != null) data['updatedAt'] = updatedAt!.toIso8601String();
    return data;
  }

  /// ✅ Copy method to update only changed fields
  UserModel copyWith({
    String? profilePic,
    String? type,
    String? name,
    String? phoneNumber,
    String? email,
    String? password,
    String? username,
    bool? isDeleted,
    String? otp,
    DateTime? otpExpires,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id,
      profilePic: profilePic ?? this.profilePic,
      type: type ?? this.type,
      name: name ?? this.name, // ✅ Ensure `name` is non-null
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      isDeleted: isDeleted ?? this.isDeleted,
      otp: otp ?? this.otp,
      otpExpires: otpExpires ?? this.otpExpires,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
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
