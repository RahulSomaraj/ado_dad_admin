class LoginResponse {
  final String id;
  final String token;
  final String refreshToken;
  final String userName;
  final String email;
  final String? phoneNumber;
  final String userType;
  final String? profilePic;

  LoginResponse({
    required this.id,
    required this.token,
    required this.refreshToken,
    required this.userName,
    required this.email,
    this.phoneNumber,
    required this.userType,
    this.profilePic,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      userType: json['type'] ??
          json['userType'], // Try 'type' first, fallback to 'userType'
      profilePic: json['profilePic'] ?? json['profilePicture'],
    );
  }
}

String getFullUserType(String shortCode) {
  switch (shortCode) {
    case 'SA':
      return "Super Admin";
    case 'AD':
      return "Admin";
    case 'NU':
      return "Normal User";
    case 'SR':
      return "Showroom";
    default:
      return "Unknown";
  }
}
